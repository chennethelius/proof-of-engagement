# Proof of Engagement 🎓

> 2025 Cypherpunk Submission

A blockchain-powered engagement tracking platform for university clubs built on Solana. Features QR code check-ins, photo proof verification, and ELO-based leaderboard rankings.

## 🚀 Features

- **📱 Flutter Mobile App** - Cross-platform iOS/Android app with Material 3 design
- **🔗 Solana Smart Contract** - On-chain club management and attendance tracking
- **📸 Photo Verification** - Camera-based photo proof for event check-ins
- **🏆 ELO Leaderboard** - Dynamic club rankings based on engagement metrics
- **📊 QR Code Check-ins** - Instant event attendance via QR scanning
- **💼 Club Management** - Create events, manage members, track engagement
- **🎨 Modern UI** - Beautiful gradient designs with Solana purple/green theme

## 📁 Project Structure

```
proof-of-engagement/
├── programs/                       # Solana smart contracts (Rust/Anchor)
│   └── proof-of-engagement/
│       ├── src/lib.rs             # Main program logic
│       └── Cargo.toml             # Rust dependencies
│
├── proof-of-engagement-app/       # Flutter mobile app
│   ├── lib/
│   │   ├── main.dart              # App entry point
│   │   ├── core/
│   │   │   ├── theme/             # Design system (tokens + components)
│   │   │   ├── router/            # Navigation
│   │   │   └── config/            # App configuration
│   │   ├── features/
│   │   │   ├── home/              # Home screen
│   │   │   ├── clubs/             # Club browsing & management
│   │   │   ├── events/            # Event creation & detail
│   │   │   ├── leaderboard/       # Club rankings
│   │   │   ├── checkin/           # QR scanning & photo check-in
│   │   │   └── auth/              # Wallet connection
│   │   └── shared/
│   │       ├── services/          # Business logic
│   │       └── providers/         # State management (Riverpod)
│   └── pubspec.yaml               # Flutter dependencies
│
├── Anchor.toml                    # Anchor configuration
├── SMART_CONTRACT.md              # Smart contract documentation
├── UI_UPDATE_GUIDE.md             # UI theme patterns
└── README.md                      # This file
```

## 🎨 Design System

The app features a comprehensive design system with:

- **Colors**: Solana purple (#9945FF) & green (#14F195) with gradients
- **Typography**: Inter for body, Poppins for headers (responsive)
- **Icons**: 200+ Material rounded icons with semantic naming
- **Spacing**: 7-point scale (4px to 64px) with responsive scaling
- **Components**: Themed buttons, cards, chips with smooth animations
- **Dark Mode**: Full dark theme support

See [UI_UPDATE_GUIDE.md](./UI_UPDATE_GUIDE.md) for complete patterns.

## 🔗 Smart Contract

**Program ID**: `HifshiXvDF4MwEevZuukURThkjrZFfspn3iP1vdFitdC`

### Account Types

- **Club** - Club information, authority, ELO rating, stats
- **Event** - Event details, capacity, timestamps
- **Attendance** - User check-ins with photo hash proof
- **Membership** - Club membership records

### Instructions

1. `register_club` - Create a new club
2. `create_event` - Create an event for a club
3. `record_attendance` - Check in to event with photo proof
4. `calculate_elo` - Update club ELO based on engagement
5. `join_club` - Join a club as a member
6. `close_event` - Mark event as inactive

See [SMART_CONTRACT.md](./SMART_CONTRACT.md) for full documentation.

## 🛠️ Tech Stack

### Smart Contract
- **Anchor** 0.29.0 - Solana framework
- **Rust** - Smart contract language
- **Solana** 1.17.3 - Blockchain platform

### Mobile App
- **Flutter** 3.0+ - Cross-platform framework
- **Dart** 3.0+ - Programming language
- **Riverpod** 2.4.9 - State management
- **Go Router** 13.0.0 - Navigation
- **Solana** 0.31.2 - Blockchain SDK
- **Mobile Scanner** 3.5.5 - QR code scanning
- **Image Picker** 1.0.7 - Camera/gallery access
- **Google Fonts** 6.1.0 - Typography

## 🚀 Getting Started

### Prerequisites

- **Rust** 1.90+
- **Solana CLI** 2.3+
- **Anchor CLI** 0.29.0+
- **Flutter** 3.0+
- **Dart** 3.0+

### Setup Smart Contract

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Solana CLI
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"

# Install Anchor
cargo install --git https://github.com/coral-xyz/anchor avm --locked --force
avm install latest
avm use latest

# Build the program
cd proof-of-engagement
anchor build

# Run tests
anchor test
```

### Setup Flutter App

```bash
cd proof-of-engagement-app

# Install dependencies
flutter pub get

# Run on iOS simulator
flutter run -d ios

# Run on Android emulator
flutter run -d android

# Build release APK
flutter build apk --release

# Build iOS app
flutter build ios --release
```

## 📦 Current Status

### ✅ Completed
- Full Flutter app with 6 screens (Home, Clubs, Events, Leaderboard, Check-in, Profile)
- Complete design system with tokens and reusable components
- Solana smart contract (all 6 instructions implemented)
- QR code generation and scanning
- Photo capture service with compression
- State management with 19 Riverpod providers
- Navigation with Go Router
- Material 3 theming with dark mode

### ⏳ In Progress
- UI theme updates on remaining screens
- Smart contract deployment to devnet
- Frontend integration with smart contract
- Photo upload to IPFS/Arweave

### 📋 TODO
- Deploy smart contract to devnet/mainnet
- Connect Flutter app to deployed program
- Replace mock data with blockchain queries
- Implement photo verification system
- Add wallet connection UI
- Production testing and optimization

## 🎯 How It Works

1. **Club Registration**: University clubs register on-chain with name and description
2. **Event Creation**: Club admins create events with location, time, and capacity
3. **QR Generation**: Each event gets a unique QR code
4. **Check-in**: Students scan QR code and take a photo at the event
5. **Proof Storage**: Photo hash stored on IPFS/Arweave, hash saved on-chain
6. **Engagement Tracking**: Attendance records update club statistics
7. **ELO Calculation**: Club rankings adjust based on event engagement rates
8. **Leaderboard**: Clubs compete for top rankings based on engagement

## 🏆 Use Cases

- **University Clubs**: Track member engagement and event attendance
- **Student Organizations**: Prove event participation for funding
- **Campus Events**: Verify attendance with photo proof
- **Club Rankings**: Competitive leaderboards drive engagement
- **Funding Allocation**: Data-driven decisions for club budgets

## 🔒 Security

- PDAs prevent address collisions
- Authority checks on all admin actions
- Duplicate attendance prevention via PDA seeds
- Time window validation for check-ins
- Capacity limits enforced
- Input validation on all data

## 📄 License

MIT

## 🤝 Contributing

This is a hackathon submission for 2025 Cypherpunk. Contributions welcome after the event!

## 📧 Contact

Max Chen - [@chennethelius](https://github.com/chennethelius)

---

**Built with ❤️ for the Solana ecosystem**
