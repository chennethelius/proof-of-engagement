# Proof of Engagement - Solana Smart Contract

## Overview

This Anchor program manages university club engagement tracking on the Solana blockchain. It handles club registration, event creation, attendance recording with photo proof, and ELO-based leaderboard rankings.

## Program Details

- **Program ID**: `HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC`
- **Anchor Version**: 0.29.0
- **Network**: Devnet (ready for deployment)
- **Binary Location**: `programs/proof-of-engagement/target/deploy/proof_of_engagement.so`

## Account Structures

### Club
Represents a university club on-chain.

```rust
pub struct Club {
    pub authority: Pubkey,      // Club admin who can create events
    pub name: String,            // Max 64 characters
    pub description: String,     // Max 256 characters
    pub elo_rating: u32,         // ELO rating (starts at 1000)
    pub total_events: u32,       // Total events created
    pub total_members: u32,      // Total members joined
    pub created_at: i64,         // Unix timestamp
    pub bump: u8,                // PDA bump seed
}
```

**PDA Seeds**: `["club", authority, name]`

### Event
Represents a club event.

```rust
pub struct Event {
    pub club: Pubkey,            // Associated club
    pub event_id: u64,           // Unique event ID per club
    pub name: String,            // Max 64 characters
    pub description: String,     // Max 256 characters
    pub location: String,        // Max 128 characters
    pub start_time: i64,         // Unix timestamp
    pub end_time: i64,           // Unix timestamp
    pub max_capacity: u32,       // Maximum attendees
    pub current_attendance: u32, // Current check-ins
    pub is_active: bool,         // Whether event is active
    pub created_at: i64,         // Unix timestamp
    pub bump: u8,                // PDA bump seed
}
```

**PDA Seeds**: `["event", club_pubkey, event_id]`

### Attendance
Records user attendance at an event with photo proof.

```rust
pub struct Attendance {
    pub event: Pubkey,           // Associated event
    pub user: Pubkey,            // User who attended
    pub timestamp: i64,          // Check-in timestamp
    pub photo_hash: String,      // IPFS/Arweave hash (max 128 chars)
    pub verified: bool,          // Verification status
    pub bump: u8,                // PDA bump seed
}
```

**PDA Seeds**: `["attendance", event_pubkey, user_pubkey]`

### Membership
Tracks user membership in clubs.

```rust
pub struct Membership {
    pub club: Pubkey,            // Associated club
    pub user: Pubkey,            // Member user
    pub joined_at: i64,          // Join timestamp
    pub is_active: bool,         // Whether membership is active
    pub bump: u8,                // PDA bump seed
}
```

**PDA Seeds**: `["membership", club_pubkey, user_pubkey]`

## Instructions

### 1. register_club
Register a new club on the blockchain.

**Parameters**:
- `name: String` - Club name (max 64 characters)
- `description: String` - Club description (max 256 characters)

**Accounts**:
- `club` - Club PDA account (initialized)
- `authority` - Club admin (signer, payer)
- `system_program` - System program

**Initial State**:
- `elo_rating`: 1000
- `total_events`: 0
- `total_members`: 0

**Example**:
```typescript
await program.methods
  .registerClub("Tech Club", "A club for tech enthusiasts")
  .accounts({
    club: clubPda,
    authority: wallet.publicKey,
    systemProgram: SystemProgram.programId,
  })
  .rpc();
```

### 2. create_event
Create a new event for a club.

**Parameters**:
- `event_id: u64` - Unique event identifier
- `name: String` - Event name (max 64 characters)
- `description: String` - Event description (max 256 characters)
- `location: String` - Event location (max 128 characters)
- `start_time: i64` - Unix timestamp (must be future)
- `end_time: i64` - Unix timestamp (must be after start_time)
- `max_capacity: u32` - Maximum attendees (must be > 0)

**Accounts**:
- `event` - Event PDA account (initialized)
- `club` - Club account (must be authority)
- `authority` - Club admin (signer, payer)
- `system_program` - System program

**Effects**:
- Increments `club.total_events`
- Creates event with `is_active = true`

**Validations**:
- `start_time` must be in the future
- `end_time` must be after `start_time`
- Only club authority can create events

### 3. record_attendance
Record user attendance at an event with photo proof.

**Parameters**:
- `photo_hash: String` - IPFS/Arweave hash (max 128 characters)

**Accounts**:
- `attendance` - Attendance PDA account (initialized)
- `event` - Event account (mutable)
- `user` - User wallet (signer, payer)
- `system_program` - System program

**Effects**:
- Creates attendance record
- Increments `event.current_attendance`
- Sets `verified = true`

**Validations**:
- Event must be active
- Current time must be between `start_time` and `end_time`
- Attendance must not exceed `max_capacity`
- User can only check in once per event (PDA prevents duplicates)

### 4. calculate_elo
Update club ELO rating based on event engagement.

**Parameters**:
- `engagement_score: u32` - Engagement percentage (0-100)

**Accounts**:
- `club` - Club account (mutable)
- `authority` - Club admin (signer)

**Algorithm**:
```
K-factor = 32
Expected score = 50%
Rating change = (engagement_score - expected_score) * K-factor / 100
New rating = old_rating + rating_change (minimum 0)
```

**Example**:
- 80% engagement (40 attendees / 50 capacity)
- Rating change = (80 - 50) * 32 / 100 = +9.6 ≈ +10
- If old rating was 1000, new rating is 1010

**Validations**:
- `engagement_score` must be 0-100
- Only club authority can calculate ELO

### 5. join_club
Join a club as a member.

**Accounts**:
- `membership` - Membership PDA account (initialized)
- `club` - Club account (mutable)
- `user` - User wallet (signer, payer)
- `system_program` - System program

**Effects**:
- Creates membership record
- Increments `club.total_members`
- Sets `is_active = true`

### 6. close_event
Mark an event as inactive (closed).

**Accounts**:
- `event` - Event account (mutable)
- `club` - Club account
- `authority` - Club admin (signer)

**Effects**:
- Sets `event.is_active = false`

**Validations**:
- Event must be active
- Only club authority can close events

## Error Codes

| Code | Error | Description |
|------|-------|-------------|
| 6000 | NameTooLong | Name exceeds 64 characters |
| 6001 | DescriptionTooLong | Description exceeds 256 characters |
| 6002 | LocationTooLong | Location exceeds 128 characters |
| 6003 | PhotoHashTooLong | Photo hash exceeds 128 characters |
| 6004 | InvalidTimestamp | Invalid time value |
| 6005 | InvalidCapacity | Capacity must be > 0 |
| 6006 | EventNotActive | Event is not active |
| 6007 | EventAtCapacity | Event has reached max capacity |
| 6008 | EventNotInProgress | Current time not in event window |
| 6009 | InvalidScore | Engagement score must be 0-100 |
| 6010 | Unauthorized | Signer not authorized |

## Deployment

### Prerequisites
- Rust and Cargo installed
- Solana CLI installed
- Anchor CLI installed (v0.29.0)
- Devnet wallet with SOL

### Steps

1. **Build the program**:
```bash
cd /Users/maxchen/Documents/GitHub/proof-of-engagement
anchor build
```

2. **Get devnet SOL** (if needed):
```bash
solana airdrop 2
```

3. **Deploy to devnet**:
```bash
anchor deploy --provider.cluster devnet
```

4. **Verify deployment**:
```bash
solana program show HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC
```

## Integration with Flutter App

### Update SolanaService

The Flutter app needs to call these instructions. Update `lib/shared/services/solana_service.dart`:

```dart
class SolanaService {
  static const programId = 'HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC';
  
  // Register a new club
  Future<String> registerClub(String name, String description) async {
    // Build transaction with register_club instruction
    // Return transaction signature
  }
  
  // Create event
  Future<String> createEvent({
    required String clubPubkey,
    required int eventId,
    required String name,
    required String description,
    required String location,
    required DateTime startTime,
    required DateTime endTime,
    required int maxCapacity,
  }) async {
    // Build transaction with create_event instruction
    // Return transaction signature
  }
  
  // Record attendance with photo
  Future<String> recordAttendance(
    String eventPubkey,
    String photoHash,
  ) async {
    // Build transaction with record_attendance instruction
    // Return transaction signature
  }
  
  // Calculate ELO after event
  Future<String> calculateElo(
    String clubPubkey,
    int engagementScore,
  ) async {
    // Build transaction with calculate_elo instruction
    // Return transaction signature
  }
  
  // Fetch all clubs for leaderboard
  Future<List<Club>> fetchClubs() async {
    // Get all Club accounts using getProgramAccounts
    // Sort by elo_rating descending
    // Return list of clubs
  }
  
  // Fetch events for a club
  Future<List<Event>> fetchClubEvents(String clubPubkey) async {
    // Get all Event accounts filtered by club
    // Return list of events
  }
  
  // Fetch attendance for an event
  Future<List<Attendance>> fetchEventAttendance(String eventPubkey) async {
    // Get all Attendance accounts filtered by event
    // Return list of attendance records
  }
}
```

## Testing

### Unit Tests

Run the included tests:
```bash
anchor test
```

### Manual Testing

1. **Register a club**:
```bash
anchor run register-club -- "Tech Club" "Club for developers"
```

2. **Create an event**:
```bash
anchor run create-event -- <club-pubkey> <event-id> "Hackathon" ...
```

3. **Check in to event**:
```bash
anchor run check-in -- <event-pubkey> <photo-hash>
```

4. **Query leaderboard**:
```bash
solana program accounts HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC
```

## Next Steps

1. ✅ Smart contract built and ready
2. ⏳ Deploy to devnet
3. ⏳ Generate TypeScript IDL types
4. ⏳ Update Flutter SolanaService with program calls
5. ⏳ Connect Riverpod providers to blockchain data
6. ⏳ Test full flow: register → create event → check in → update ELO
7. ⏳ Deploy to mainnet

## Security Considerations

- All PDAs use proper seeds to prevent address collisions
- Authority checks ensure only club admins can manage clubs/events
- Duplicate attendance prevented by PDA constraint
- Capacity limits enforced before recording attendance
- Time window validation for event check-ins
- Input validation for all string lengths

## Gas Optimization

- Uses PDAs instead of separate keypair accounts
- Efficient account sizes calculated
- Minimal compute units per instruction
- No unnecessary account copies

## License

MIT
