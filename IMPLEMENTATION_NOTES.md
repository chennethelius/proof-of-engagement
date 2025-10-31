# Solana Transaction Implementation Notes

## Current Status
The Solana program is successfully deployed to devnet:
- Program ID: `DGMwn7z9fqvaDVXy7tuiXcjvUT8T94Hz5VuTyYo2RPGn`
- IDL: `/target/idl/proof_of_engagement.json`
- PDA Service: `/lib/shared/services/pda_service.dart` ✅

## Implementation Approach

Due to limitations with the `solana` Dart package's transaction building API, we have two options:

### Option 1: Use solana package's low-level API (Recommended for production)
- Build transactions manually with proper instruction encoding
- Requires understanding Borsh serialization
- More control but more complex

### Option 2: Use Anchor TS + Flutter WebView (Easier for MVP)
- Create a simple TypeScript service using `@coral-xyz/anchor`
- Expose functions via WebView bridge
- Flutter calls TS functions for transactions
- Faster to implement, proven to work

### Option 3: Keep Mock + Manual Testing (Current MVP approach)
- Keep current mock implementations
- Test actual transactions using Anchor CLI
- Focus on UI/UX flow first
- Replace with real transactions later

## Recommended: Option 3 for Hackathon MVP

For the hackathon deadline, I recommend:

1. **Keep the current mock structure** - UI flow works
2. **Test transactions separately** using Anchor CLI:
   ```bash
   anchor test
   # or
   solana program call <program-id> <instruction-data>
   ```

3. **Build QR code flow** - Most important for demo
4. **Replace mocks post-hackathon** when there's time to properly integrate

## Transaction Structure Reference

### Register Club
```typescript
// Instruction discriminator
const discriminator = sha256("global:register_club").slice(0, 8);

// Accounts
[
  { pubkey: clubPda, isSigner: false, isWritable: true },
  { pubkey: authority, isSigner: true, isWritable: true },
  { pubkey: SystemProgram.programId, isSigner: false, isWritable: false }
]

// Data (Borsh encoded)
{
  name: string,
  description: string
}
```

### Create Event
```typescript
// Accounts
[
  { pubkey: eventPda, isSigner: false, isWritable: true },
  { pubkey: clubPda, isSigner: false, isWritable: true },
  { pubkey: authority, isSigner: true, isWritable: true },
  { pubkey: SystemProgram.programId, isSigner: false, isWritable: false }
]

// Data
{
  eventId: u64,
  name: string,
  description: string,
  location: string,
  startTime: i64,
  endTime: i64,
  maxCapacity: u32
}
```

### Record Attendance (QR Code Check-in)
```typescript
// Accounts
[
  { pubkey: attendancePda, isSigner: false, isWritable: true },
  { pubkey: eventPda, isSigner: false, isWritable: true },
  { pubkey: user, isSigner: true, isWritable: true },
  { pubkey: SystemProgram.programId, isSigner: false, isWritable: false }
]

// Data
{
  photoHash: string
}
```

## Next Steps for Full Implementation

1. Add `borsh` package to pubspec.yaml
2. Create proper Borsh serialization helpers
3. Generate instruction discriminators
4. Build transactions with proper account metas
5. Test on devnet

Or use Anchor TS bridge for faster development.
