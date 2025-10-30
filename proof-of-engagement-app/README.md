# Proof of Engagement - Mobile App

A blockchain-powered mobile application built with Flutter for tracking club engagement and events at universities using the Solana blockchain.

## 🎯 Project Overview

Proof of Engagement is a decentralized app (dApp) that helps university clubs:
- Track member engagement through QR code-based event check-ins
- Record events and attendance on the Solana blockchain
- Rank clubs using an ELO-based algorithm on a public leaderboard
- Secure funding through on-chain verified engagement metrics
- Reward active members with points that can be redeemed via Solana wallet integration

Built for the **Cypherpunk Solana Hackathon**.

---

## 🏗️ Architecture & Tech Stack

### **Frontend - Flutter Mobile App**

#### **Architecture Pattern: Clean Architecture + Feature-First**

```
lib/
├── core/                          # Core app configuration
│   ├── config/
│   │   └── app_config.dart        # Environment & network configuration
│   ├── router/
│   │   └── app_router.dart        # GoRouter navigation setup
│   └── theme/
│       └── app_theme.dart         # Material 3 theming
│
├── features/                      # Feature-first modular structure
│   ├── auth/
│   │   └── presentation/          # Wallet connection screens
│   ├── clubs/
│   │   ├── domain/
│   │   │   └── entities/         # Club models & business logic
│   │   ├── data/
│   │   │   ├── repositories/     # Data access layer
│   │   │   └── datasources/      # API & blockchain data sources
│   │   └── presentation/
│   │       ├── screens/          # Club screens
│   │       ├── widgets/          # Reusable club components
│   │       └── providers/        # Riverpod state management
│   ├── events/
│   │   ├── domain/               # Event entities & use cases
│   │   ├── data/                 # Event repositories
│   │   └── presentation/         # Event UI & QR scanning
│   ├── leaderboard/
│   │   ├── domain/               # ELO algorithm & ranking logic
│   │   └── presentation/         # Leaderboard UI
│   └── profile/
│       ├── domain/               # User entities & stats
│       └── presentation/         # Profile & rewards UI
│
├── shared/                        # Shared utilities
│   ├── services/
│   │   ├── solana_service.dart   # Solana blockchain interaction
│   │   └── phantom_wallet_service.dart  # Phantom wallet integration
│   ├── widgets/                  # Shared UI components
│   └── utils/                    # Helper functions
│
└── main.dart                      # App entry point
```

### **State Management: Riverpod**
- Type-safe dependency injection
- Reactive state management
- Provider composition for complex state
- Code generation for boilerplate reduction

### **Navigation: GoRouter**
- Declarative routing
- Deep linking support
- Type-safe route parameters
- URL-based navigation (ready for web expansion)

---

## 📦 Key Dependencies

### **Blockchain & Wallet**
- `solana: ^0.30.5` - Solana RPC client for blockchain interaction
- `phantom_connect: ^0.1.0` - Phantom wallet deep linking & connection
- `web3dart: ^2.7.1` - Additional Web3 utilities
- `bip39: ^1.0.6` - Mnemonic phrase generation
- `ed25519_hd_key: ^2.2.0` - HD key derivation for Solana

### **QR Code & Check-In**
- `qr_flutter: ^4.1.0` - Generate QR codes for events
- `mobile_scanner: ^3.5.5` - High-performance QR code scanning

### **Image Handling (Event Proof)**
- `image_picker: ^1.0.7` - Camera & gallery access for event photos
- `cached_network_image: ^3.3.1` - Optimized image loading from IPFS/CDN

### **State & Data**
- `flutter_riverpod: ^2.4.9` - State management
- `hive: ^2.2.3` - Local NoSQL storage for offline-first architecture
- `shared_preferences: ^2.2.2` - Key-value persistence

### **API & Network**
- `dio: ^5.4.0` - HTTP client with interceptors & retry logic
- `freezed: ^2.4.6` - Immutable model generation
- `json_serializable: ^6.7.1` - JSON serialization

---

## 🔗 Solana Integration

### **Phantom Wallet Connection Flow**

```dart
// 1. User clicks "Connect Wallet"
PhantomWalletService.connect()

// 2. Deep link to Phantom mobile app
phantom://v1/connect?
  app_url=proofofengagement://
  &dapp_encryption_public_key=<key>
  &redirect_link=proofofengagement://connected

// 3. User approves in Phantom
// 4. Receive public key & session token
// 5. Store connection state via Riverpod

final walletState = ref.watch(walletServiceProvider);
if (walletState.isConnected) {
  // User is authenticated
}
```

### **On-Chain Program Structure (Rust)**

```rust
// Solana Program (will be in separate repo)
pub mod proof_of_engagement {
    // Accounts
    - Club Account (stores club metadata, ELO rating, wallet)
    - Event Account (event details, attendance cap, timestamp)
    - Attendance Account (user + event + timestamp + verified)
    
    // Instructions
    - initialize_club(name, description, wallet)
    - create_event(club_id, name, capacity, date)
    - record_attendance(event_id, user_wallet, proof_hash)
    - update_elo_rating(club_id, new_rating)
}
```

### **Transaction Flow Example: Event Check-In**

```dart
// Mobile app flow
1. User scans QR code at event
2. QR contains: eventId + clubWallet + timestamp + signature
3. App validates QR code signature
4. App takes photo of event (crowd shot)
5. Upload photo to IPFS/Arweave → get hash
6. Build Solana transaction:
   - Instruction: record_attendance
   - Accounts: [event_pda, user_wallet, club_wallet]
   - Data: [event_id, photo_ipfs_hash, timestamp]
7. Send to Phantom for signing
8. User approves in Phantom
9. Submit signed transaction to Solana
10. Confirm transaction & update UI
11. Award points to user
```

---

## 🏆 ELO Ranking Algorithm

### **Formula Components**

```dart
class EloFormula {
  static const int kFactor = 32;
  static const int baseRating = 1000;
  
  // Factors (weighted 0-100 score):
  // 1. Event Frequency (30%) - consistency bonus
  // 2. Attendance Rate (25%) - avg turnout vs capacity
  // 3. Event Proof (15%) - photo verification
  // 4. Member Retention (20%) - active users month-over-month
  // 5. Growth Rate (10%) - new member acquisition
  
  static int calculateNewRating({
    required int currentRating,
    required int eventsThisMonth,
    required double avgAttendanceRate,
    required bool hasEventProof,
    required double memberRetentionRate,
    required double growthRate,
  }) {
    double performanceScore = 
      (eventsThisMonth * 5).clamp(0, 30) +
      (avgAttendanceRate * 25) +
      (hasEventProof ? 15 : 0) +
      (memberRetentionRate * 20) +
      (growthRate * 10);
    
    double normalizedScore = performanceScore / 100;
    double expectedScore = 1 / (1 + pow(10, (1500 - currentRating) / 400));
    int ratingChange = (kFactor * (normalizedScore - expectedScore)).round();
    
    return currentRating + ratingChange;
  }
}
```

### **Leaderboard Updates**
- Calculated **weekly** based on the previous 30 days of activity
- Stored on-chain to prevent manipulation
- Transparent formula - clubs can see exactly how they're ranked

---

## 🎨 UI/UX Design

### **Theme: Solana Purple & Green**
- Primary: `#9945FF` (Solana Purple)
- Secondary: `#14F195` (Solana Green)
- Dark mode optimized for crypto aesthetics
- Material 3 design system

### **Key Screens**

#### 1. **Splash & Wallet Connection**
- Brand intro animation
- "Connect Phantom" CTA
- Deep link to Phantom app

#### 2. **Home Dashboard**
- User stats card (total points, clubs joined)
- Quick actions grid:
  - Browse Clubs
  - Upcoming Events
  - Scan QR Code
  - View Leaderboard

#### 3. **Clubs List & Detail**
- Filterable list of campus clubs
- Club detail with:
  - ELO rating & rank
  - Top members (excluding eboard)
  - Upcoming events
  - Join button (requires transaction)

#### 4. **Event Check-In**
- QR code scanner with live camera feed
- Countdown timer (QR expires after 5 min)
- Camera capture for crowd photo
- Transaction confirmation UI
- Success animation with points earned

#### 5. **Leaderboard**
- Sortable table: Rank | Club | ELO | Trend
- Filter by category/time period
- Club detail on tap

#### 6. **Profile & Rewards**
- Wallet balance (SOL)
- Total points across all clubs
- Per-club engagement breakdown
- Reward redemption (future: NFTs, tokens)

---

## 🔐 Security & Verification

### **QR Code Security**
```dart
// QR generation (club admin only)
final qrData = {
  'eventId': event.id,
  'clubWallet': club.walletAddress,
  'timestamp': DateTime.now().toIso8601String(),
  'expiresAt': DateTime.now().add(Duration(minutes: 5)),
  'signature': await signMessage(message: eventData),
};

// QR validation (user scan)
bool validateQR(Map<String, dynamic> qrData) {
  if (DateTime.parse(qrData['expiresAt']).isBefore(DateTime.now())) {
    return false; // Expired
  }
  return verifySignature(qrData['signature'], qrData);
}
```

### **Event Proof Verification**
- Admins must upload photo within 24 hours of event end
- Photo stored on IPFS (immutable, content-addressed)
- IPFS hash recorded on-chain with attendance data
- Community can verify photos via IPFS gateway

### **Anti-Gaming Measures**
- One check-in per user per event (enforced on-chain)
- QR codes expire after 5 minutes (prevents sharing)
- Photo requirement prevents phantom events
- ELO algorithm penalizes low retention (prevents one-time boosts)

---

## 🚀 Development Phases

### **Phase 1: MVP (Hackathon Deadline)** ✅
- [x] Flutter app scaffolding with clean architecture
- [x] Phantom wallet integration
- [x] Basic UI screens (splash, home, clubs, events)
- [ ] QR code generation & scanning
- [ ] Mock Solana transactions (devnet)
- [ ] ELO calculation logic
- [ ] Leaderboard UI

### **Phase 2: Blockchain Integration** 🔄
- [ ] Deploy Solana program to devnet
- [ ] Implement program instructions (Rust)
- [ ] Connect Flutter app to program
- [ ] End-to-end transaction flow
- [ ] IPFS image upload integration

### **Phase 3: Polish & Launch** 📅
- [ ] UI animations & transitions
- [ ] Error handling & loading states
- [ ] Offline-first architecture with Hive
- [ ] Push notifications for events
- [ ] Admin dashboard for clubs
- [ ] Mainnet deployment

### **Phase 4: Advanced Features** 🔮
- [ ] NFT rewards for top members
- [ ] Token-gated exclusive events
- [ ] Cross-university leaderboards
- [ ] DAO governance for funding allocation
- [ ] Integration with Raydium for liquidity pools

---

## 🛠️ Getting Started

### **Prerequisites**
- Flutter 3.0+ with Dart 3.0+
- Phantom Wallet app (iOS/Android)
- Solana CLI tools (for program development)
- Rust & Anchor framework (for smart contracts)

### **Installation**

```bash
# Clone repository
git clone https://github.com/chennethelius/proof-of-engagement.git
cd proof-of-engagement/proof-of-engagement-app

# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Run on device/simulator
flutter run
```

### **Environment Configuration**

Create `.env` file:
```env
SOLANA_NETWORK=devnet
SOLANA_RPC_URL=https://api.devnet.solana.com
PROGRAM_ID=<your_deployed_program_id>
IPFS_GATEWAY=https://ipfs.io/ipfs/
```

---

## 📊 Data Models

### **Club**
```dart
class Club {
  final String id;
  final String name;
  final String walletAddress;
  final int eloRating;
  final int rank;
  final int totalEvents;
  final int totalMembers;
  final List<String> eboard;
}
```

### **Event**
```dart
class Event {
  final String id;
  final String clubId;
  final String name;
  final DateTime startTime;
  final int maxCapacity;
  final int currentAttendance;
  final String qrCodeData;
  final String? blockchainTxHash;
}
```

### **UserEngagement**
```dart
class UserEngagement {
  final String userId;
  final String clubId;
  final int points;
  final int eventsAttended;
  final bool isEboard;
}
```

---

## 🧪 Testing Strategy

### **Unit Tests**
- ELO calculation accuracy
- QR code validation logic
- Wallet connection state management

### **Integration Tests**
- Solana transaction flow
- IPFS upload/retrieval
- Database persistence

### **E2E Tests**
- Full user journey: wallet connect → join club → attend event → earn points

---

## 📝 License

MIT License - see [LICENSE](../LICENSE) for details

---

## 🤝 Contributing

This project is built for the Cypherpunk Solana Hackathon. Contributions welcome after the hackathon deadline.

---

## 👥 Team

- **Max Chen** - [@chennethelius](https://github.com/chennethelius)

---

## 🔗 Resources

- [Phantom Developer Docs](https://docs.phantom.app/)
- [Solana Docs](https://docs.solana.com/)
- [Anchor Framework](https://www.anchor-lang.com/)
- [Flutter](https://flutter.dev/)

---

**Built with ❤️ for the Cypherpunk Solana Hackathon**