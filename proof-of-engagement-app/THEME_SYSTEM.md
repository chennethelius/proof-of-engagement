# 🎨 Theme System Documentation

## Overview
Complete theme system with tokens, responsive utilities, and reusable components for consistent UI/UX across the app.

## 📁 File Structure

```
lib/core/theme/
├── tokens/
│   ├── app_colors.dart          # Color palette & gradients
│   ├── app_spacing.dart         # Spacing & border radius
│   ├── app_typography.dart      # Text styles with Google Fonts
│   ├── app_icons.dart           # Semantic icon pack (200+ icons)
│   ├── app_animations.dart      # Animation durations & curves
│   ├── app_responsive.dart      # Responsive design utilities
│   └── tokens.dart              # Barrel export
├── widgets/
│   ├── app_button.dart          # Themed button component
│   ├── app_card.dart            # Themed card component
│   └── widgets.dart             # Barrel export
└── app_theme.dart               # Main theme configuration
```

---

## 🎨 Design Tokens

### Colors (`AppColors`)

#### Brand Colors
```dart
AppColors.primaryPurple        // #9945FF (Solana purple)
AppColors.primaryPurpleLight   // #B574FF
AppColors.primaryPurpleDark    // #7A2FD3
AppColors.secondaryGreen       // #14F195
AppColors.secondaryGreenLight  // #5AFFB8
AppColors.secondaryGreenDark   // #00C87E
```

#### Accent Colors
```dart
AppColors.accentBlue    // #4A9EFF
AppColors.accentPink    // #FF6EC7
AppColors.accentOrange  // #FF9500
AppColors.accentYellow  // #FFD60A
```

#### Gray Scale
```dart
AppColors.gray50   // #FAFAFA
AppColors.gray100  // #F5F5F5
AppColors.gray200  // #EEEEEE
AppColors.gray300  // #E0E0E0
AppColors.gray400  // #BDBDBD
AppColors.gray500  // #9E9E9E
AppColors.gray600  // #757575
AppColors.gray700  // #616161
AppColors.gray800  // #424242
AppColors.gray900  // #212121
```

#### Dark Mode
```dart
AppColors.darkBackground        // #0A0A0F
AppColors.darkSurface           // #1A1A24
AppColors.darkSurfaceElevated   // #252530
```

#### Semantic Colors
```dart
AppColors.success   // #00D084
AppColors.warning   // #FFB800
AppColors.error     // #FF3B30
AppColors.info      // #007AFF
```

#### Rank Colors
```dart
AppColors.rankGold    // #FFD700
AppColors.rankSilver  // #C0C0C0
AppColors.rankBronze  // #CD7F32
```

#### Gradients
```dart
AppColors.primaryGradient   // Purple → Green
AppColors.heroGradient      // Purple → Blue → Green
AppColors.cardGradient      // Subtle purple gradient
```

---

### Spacing (`AppSpacing`)

#### Constants
```dart
AppSpacing.xs    // 4.0
AppSpacing.sm    // 8.0
AppSpacing.md    // 16.0
AppSpacing.lg    // 24.0
AppSpacing.xl    // 32.0
AppSpacing.xxl   // 48.0
AppSpacing.xxxl  // 64.0
```

#### Responsive Spacing
```dart
// Automatically scales based on screen size
AppSpacing.responsive(context, AppSpacing.md)

// Screen padding with breakpoints
AppSpacing.screenPaddingResponsive(context)
```

#### Border Radius
```dart
AppSpacing.radiusXS    // 4.0
AppSpacing.radiusSM    // 8.0
AppSpacing.radiusMD    // 12.0
AppSpacing.radiusLG    // 16.0
AppSpacing.radiusXL    // 20.0
AppSpacing.radiusXXL   // 24.0
AppSpacing.radiusFull  // 999.0 (pill shape)

// BorderRadius helpers
AppSpacing.borderRadiusMD
AppSpacing.borderRadiusLG
// etc...
```

---

### Typography (`AppTypography`)

Uses **Inter** for body text and **Poppins** for display/headers.

#### Display Styles
```dart
AppTypography.displayLarge(context)   // 57px, bold
AppTypography.displayMedium(context)  // 45px, bold
AppTypography.displaySmall(context)   // 36px, semibold
```

#### Headline Styles
```dart
AppTypography.headlineLarge(context)   // 32px, semibold
AppTypography.headlineMedium(context)  // 28px, semibold
AppTypography.headlineSmall(context)   // 24px, semibold
```

#### Title Styles
```dart
AppTypography.titleLarge(context)   // 22px, semibold
AppTypography.titleMedium(context)  // 16px, semibold
AppTypography.titleSmall(context)   // 14px, semibold
```

#### Body Styles
```dart
AppTypography.bodyLarge(context)   // 16px, regular
AppTypography.bodyMedium(context)  // 14px, regular
AppTypography.bodySmall(context)   // 12px, regular
```

#### Label Styles
```dart
AppTypography.labelLarge(context)   // 14px, semibold
AppTypography.labelMedium(context)  // 12px, semibold
AppTypography.labelSmall(context)   // 11px, semibold
```

All text styles are **responsive** - automatically scale based on screen size!

---

### Icons (`AppIcons`)

**200+ semantic icons** using Material Rounded style.

#### Navigation
```dart
AppIcons.home, AppIcons.homeFilled
AppIcons.clubs, AppIcons.clubsFilled
AppIcons.events, AppIcons.eventsFilled
AppIcons.leaderboard, AppIcons.leaderboardFilled
AppIcons.profile, AppIcons.profileFilled
```

#### Actions
```dart
AppIcons.add, AppIcons.edit, AppIcons.delete
AppIcons.save, AppIcons.cancel, AppIcons.share
AppIcons.favorite, AppIcons.favoriteFilled
```

#### QR & Scanning
```dart
AppIcons.qrCode, AppIcons.qrScan
AppIcons.camera, AppIcons.flash
```

#### Blockchain
```dart
AppIcons.wallet, AppIcons.payment
AppIcons.blockchain, AppIcons.transaction
AppIcons.crypto, AppIcons.coin
```

#### Social
```dart
AppIcons.star, AppIcons.trophy
AppIcons.medal, AppIcons.badge
```

#### Icon Sizes
```dart
AppIconSize.xs    // 16
AppIconSize.sm    // 20
AppIconSize.md    // 24
AppIconSize.lg    // 32
AppIconSize.xl    // 40
AppIconSize.xxl   // 48
AppIconSize.xxxl  // 64

// Responsive sizing
AppIconSize.responsive(context, AppIconSize.md)
```

---

### Animations (`AppAnimations`)

#### Durations
```dart
AppAnimations.instant  // 0ms
AppAnimations.fast     // 150ms
AppAnimations.normal   // 250ms
AppAnimations.slow     // 350ms
AppAnimations.slower   // 500ms
AppAnimations.slowest  // 700ms
```

#### Curves
```dart
AppAnimations.smooth       // easeInOutCubic
AppAnimations.playful      // easeOutBack (bouncy)
AppAnimations.elastic      // elasticOut
AppAnimations.decelerate   // decelerate
```

#### Page Transitions
```dart
AppAnimations.fadeRoute(page: MyPage())
AppAnimations.slideRoute(page: MyPage())
AppAnimations.scaleRoute(page: MyPage())
```

#### Helper Widgets
```dart
AppAnimations.fadeIn(child: widget)
AppAnimations.slideIn(child: widget)
AppAnimations.scaleIn(child: widget)
```

---

### Responsive (`AppResponsive`)

#### Breakpoints
```dart
AppResponsive.mobileBreakpoint        // 600
AppResponsive.tabletBreakpoint        // 900
AppResponsive.desktopBreakpoint       // 1200
AppResponsive.largeDesktopBreakpoint  // 1800
```

#### Device Type Checks
```dart
AppResponsive.isMobile(context)
AppResponsive.isTablet(context)
AppResponsive.isDesktop(context)
```

#### Responsive Values
```dart
AppResponsive.value(
  context: context,
  mobile: 2,
  tablet: 3,
  desktop: 4,
)
```

#### Context Extensions
```dart
context.isMobile
context.screenWidth
context.screenHeight
context.responsiveValue(mobile: 100, tablet: 150)
```

---

## 🧩 Components

### AppButton

#### Variants
```dart
AppButton.primary(
  text: 'Primary Button',
  onPressed: () {},
  size: AppButtonSize.medium,
  isFullWidth: false,
  isLoading: false,
  icon: AppIcons.add,
)

AppButton.secondary(...)
AppButton.outlined(...)
AppButton.text(...)
AppButton.gradient(...)  // With gradient background!
```

#### Features
- ✅ 5 variants (primary, secondary, outlined, text, gradient)
- ✅ 3 sizes (small, medium, large)
- ✅ Loading state with spinner
- ✅ Prefix/suffix icons
- ✅ Full-width option
- ✅ Smooth press animation
- ✅ Auto-disabled styling

---

### AppCard

#### Variants
```dart
AppCard(
  child: Text('Standard Card'),
  onTap: () {},
  padding: EdgeInsets.all(16),
  showShadow: true,
)

AppCard.gradient(...)   // With gradient background
AppCard.outlined(...)   // With border
AppCard.elevated(...)   // Elevated shadow
```

#### Animated Card
```dart
AnimatedAppCard(
  child: Text('Taps with scale animation'),
  onTap: () {},
)
```

#### Shimmer Loading
```dart
ShimmerCard(
  height: 120,
  width: double.infinity,
)
```

---

## 🚀 Usage Examples

### Update a Screen with New Theme

**Before:**
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.purple,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 24, color: Colors.white),
  ),
)
```

**After:**
```dart
AppCard.gradient(
  padding: EdgeInsets.all(AppSpacing.md),
  child: Text(
    'Hello',
    style: AppTypography.headlineSmall(context)
        .copyWith(color: AppColors.white),
  ),
)
```

---

### Responsive Layout Example

```dart
GridView.count(
  crossAxisCount: AppResponsive.gridColumns(
    context,
    mobile: 2,
    tablet: 3,
    desktop: 4,
  ),
  children: [...],
)
```

---

### Button with Icon

```dart
AppButton.primary(
  text: 'Scan QR Code',
  icon: AppIcons.qrScan,
  onPressed: () => context.push('/scan'),
  isFullWidth: true,
)
```

---

### Animated Page Transition

```dart
// In your GoRouter
GoRoute(
  path: '/details',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      child: DetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return AppAnimations.scaleTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  },
)
```

---

## 📋 Next Steps

### To Update Screens:

1. **Import theme tokens:**
   ```dart
   import 'package:proof_of_engagement_app/core/theme/tokens/tokens.dart';
   import 'package:proof_of_engagement_app/core/theme/widgets/widgets.dart';
   ```

2. **Replace hardcoded values:**
   - `Colors.purple` → `AppColors.primaryPurple`
   - `EdgeInsets.all(16)` → `EdgeInsets.all(AppSpacing.md)`
   - `Icons.add` → `AppIcons.add`
   - `TextStyle(...)` → `AppTypography.bodyLarge(context)`

3. **Use themed components:**
   - `ElevatedButton` → `AppButton.primary`
   - `Card` → `AppCard`
   - Add animations with `AppAnimations.fadeIn()`

4. **Make it responsive:**
   - Wrap with responsive utilities
   - Use `context.isMobile` checks
   - Use responsive spacing/sizing functions

---

## 🎯 Design Philosophy

- **Consistent**: All UI uses centralized tokens
- **Responsive**: Auto-scales for all screen sizes
- **Playful**: Bouncy animations, gradients, shadows
- **Smooth**: Fast transitions, no janky animations
- **Modern**: Material 3, rounded icons, Solana aesthetic
- **Accessible**: Proper contrast ratios, touch targets

---

## 🔧 Current Status

✅ **Completed:**
- Theme token system (colors, spacing, typography, icons, animations, responsive)
- Main theme configuration (light + dark modes)
- Reusable components (AppButton, AppCard)
- Responsive utilities
- Google Fonts integration

⏳ **To Do:**
- Update all 6 screens to use new theme
- Add more reusable components (TextField, Dialog, etc.)
- Integrate animations in screen transitions
- Add hero animations for images
- Create loading/error/empty states

---

## 💡 Pro Tips

1. **Always use context for responsive values:**
   ```dart
   AppTypography.bodyLarge(context)  // ✅
   AppSpacing.responsive(context, 16) // ✅
   ```

2. **Use semantic icon names:**
   ```dart
   AppIcons.qrScan  // ✅ Clear intent
   Icons.qr_code_2  // ❌ Not semantic
   ```

3. **Prefer themed components:**
   ```dart
   AppButton.primary(...)  // ✅ Consistent styling
   ElevatedButton(...)     // ❌ Need to style manually
   ```

4. **Use responsive values for layouts:**
   ```dart
   context.responsiveValue(mobile: 2, tablet: 3)  // ✅
   2  // ❌ Not responsive
   ```

---

Made with 💜 for Proof of Engagement
