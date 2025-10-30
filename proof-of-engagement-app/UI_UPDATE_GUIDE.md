# UI Theme Update Guide

## Quick Reference: Theme System Migration

### ✅ Completed Screens
- ✅ **home_screen.dart** - Full theme implementation with gradients
- ✅ **clubs_list_screen.dart** - AnimatedAppCard, rank badges, responsive layout
- ⏳ **leaderboard_screen.dart** - Partially updated (AppBar + filters)

### 🔄 Pattern for Updating Screens

#### 1. **Add Imports**
```dart
// Add these two imports at the top
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';
```

#### 2. **Replace Common Elements**

| Old | New |
|-----|-----|
| `Colors.purple` | `AppColors.primaryPurple` |
| `Colors.green` | `AppColors.secondaryGreen` |
| `Colors.grey` | `AppColors.gray500` (or appropriate shade) |
| `EdgeInsets.all(16)` | `EdgeInsets.all(AppSpacing.md)` |
| `SizedBox(height: 8)` | `SizedBox(height: AppSpacing.sm)` |
| `BorderRadius.circular(12)` | `BorderRadius.circular(AppSpacing.radiusMD)` |
| `Icons.add` | `AppIcons.add` |
| `Icons.search` | `AppIcons.search` |
| `TextStyle(fontSize: 16)` | `AppTypography.bodyLarge(context)` |
| `Card()` | `AppCard()` or `AnimatedAppCard()` |
| `ElevatedButton()` | `AppButton.primary()` |

#### 3. **Spacing Scale**
```dart
AppSpacing.xs    // 4px
AppSpacing.sm    // 8px
AppSpacing.md    // 16px
AppSpacing.lg    // 24px
AppSpacing.xl    // 32px
AppSpacing.xxl   // 48px
AppSpacing.xxxl  // 64px

// For responsive padding
AppSpacing.screenPaddingResponsive(context)
```

#### 4. **Typography Hierarchy**
```dart
// Headers
AppTypography.displayLarge(context)    // 57px - Hero text
AppTypography.headlineLarge(context)   // 32px - Page titles
AppTypography.titleLarge(context)      // 22px - Section titles
AppTypography.titleMedium(context)     // 16px - Card titles

// Body
AppTypography.bodyLarge(context)       // 16px - Main text
AppTypography.bodyMedium(context)      // 14px - Secondary text
AppTypography.bodySmall(context)       // 12px - Captions

// Labels
AppTypography.labelLarge(context)      // 14px - Buttons
AppTypography.labelMedium(context)     // 12px - Chips
AppTypography.labelSmall(context)      // 11px - Tags
```

#### 5. **Common Icons**
```dart
// Navigation
AppIcons.home, AppIcons.homeFilled
AppIcons.clubs, AppIcons.clubsFilled
AppIcons.events, AppIcons.eventsFilled
AppIcons.leaderboard, AppIcons.leaderboardFilled
AppIcons.profile, AppIcons.profileFilled

// Actions
AppIcons.add, AppIcons.edit, AppIcons.delete
AppIcons.search, AppIcons.filter, AppIcons.sort
AppIcons.share, AppIcons.favorite, AppIcons.favoriteFilled

// QR & Camera
AppIcons.qrCode, AppIcons.qrScan
AppIcons.camera, AppIcons.photo, AppIcons.gallery

// Blockchain
AppIcons.wallet, AppIcons.transaction, AppIcons.crypto

// Social
AppIcons.star, AppIcons.trophy, AppIcons.medal

// Status
AppIcons.checkCircle, AppIcons.error, AppIcons.warning, AppIcons.info

// Data
AppIcons.calendar, AppIcons.time, AppIcons.location, AppIcons.people

// With size
Icon(AppIcons.home, size: AppIconSize.md)
Icon(AppIcons.trophy, size: AppIconSize.responsive(context, AppIconSize.lg))
```

---

## Screen-by-Screen Updates

### 📱 Leaderboard Screen (leaderboard_screen.dart)

**Current Status:** AppBar and filters updated

**Remaining Updates:**
1. Replace Card widgets with AnimatedAppCard for leaderboard entries
2. Add rank badge gradients (gold/silver/bronze)
3. Update stat display with themed chips
4. Add fade-in animations for list items

**Key Elements:**
```dart
// Rank badge with gradient
Container(
  decoration: BoxDecoration(
    gradient: _getRankGradient(rank),
    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
  ),
  child: Icon(AppIcons.trophy, color: AppColors.white),
)

// Stats row
Wrap(
  spacing: AppSpacing.sm,
  children: [
    _buildStatChip(AppIcons.star, '${rating} ELO'),
    _buildStatChip(AppIcons.people, '${members}'),
    _buildStatChip(AppIcons.trending, '+${change}%'),
  ],
)
```

---

### 🏛️ Club Detail Screen (club_detail_screen.dart)

**Updates Needed:**
1. Hero image with gradient overlay
2. AppCard.gradient for club info section
3. Themed stat cards with icons
4. AppButton for join/leave actions
5. Event list with AnimatedAppCard

**Key Pattern:**
```dart
// Hero section
Stack(
  children: [
    // Image with gradient overlay
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.black.withOpacity(0.7)],
        ),
      ),
    ),
    // Club name overlay
    Positioned(
      bottom: AppSpacing.lg,
      left: AppSpacing.md,
      child: Text(
        clubName,
        style: AppTypography.displaySmall(context).copyWith(
          color: AppColors.white,
        ),
      ),
    ),
  ],
)

// Action buttons
Row(
  children: [
    Expanded(
      child: AppButton.primary(
        text: 'Join Club',
        icon: AppIcons.add,
        onPressed: () {},
      ),
    ),
    SizedBox(width: AppSpacing.sm),
    AppButton.outlined(
      text: 'Share',
      icon: AppIcons.share,
      onPressed: () {},
    ),
  ],
)
```

---

### 📅 Event Detail Screen (event_detail_screen.dart)

**Updates Needed:**
1. Event header with image and gradient overlay
2. Info cards with icons (date, time, location, capacity)
3. QR code display with AppCard.gradient
4. AppButton for RSVP/Check-in
5. Attendee list with avatars

**Key Pattern:**
```dart
// Info cards
GridView.count(
  crossAxisCount: 2,
  children: [
    _buildInfoCard(
      icon: AppIcons.calendar,
      label: 'Date',
      value: date,
      color: AppColors.accentBlue,
    ),
    _buildInfoCard(
      icon: AppIcons.time,
      label: 'Time',
      value: time,
      color: AppColors.accentPink,
    ),
  ],
)

// QR Code card
AppCard.gradient(
  child: Column(
    children: [
      QrImageView(data: qrCode, size: 200),
      Text('Scan to Check In', style: AppTypography.titleMedium(context)),
    ],
  ),
)
```

---

### ✏️ Create Event Screen (create_event_screen.dart)

**Updates Needed:**
1. Form fields with themed InputDecoration
2. Date/time pickers with icon buttons
3. Toggle switches with brand colors
4. AppButton.gradient for submit button
5. Fix AlertDialog layout (already partially done)

**Key Pattern:**
```dart
// Text field
TextField(
  style: AppTypography.bodyLarge(context),
  decoration: InputDecoration(
    labelText: 'Event Name',
    labelStyle: AppTypography.bodyMedium(context),
    prefixIcon: Icon(AppIcons.events),
  ),
)

// Date picker button
AppButton.outlined(
  text: formattedDate,
  icon: AppIcons.calendar,
  onPressed: () => _selectDate(context),
)

// Submit button
AppButton.gradient(
  text: 'Create Event',
  icon: AppIcons.add,
  isFullWidth: true,
  onPressed: _submitForm,
)
```

---

### 📸 Check-in Screen (checkin_screen.dart)

**Updates Needed:**
1. Camera viewfinder with themed overlay
2. Flash/flip camera buttons with AppIcons
3. Success feedback with AppCard.gradient
4. AppButton for manual entry
5. Animated success state

**Key Pattern:**
```dart
// Camera controls
Positioned(
  bottom: AppSpacing.xl,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: Icon(AppIcons.flash, color: AppColors.white),
        iconSize: AppIconSize.lg,
        onPressed: toggleFlash,
      ),
      SizedBox(width: AppSpacing.xxl),
      IconButton(
        icon: Icon(AppIcons.flipCamera, color: AppColors.white),
        iconSize: AppIconSize.lg,
        onPressed: flipCamera,
      ),
    ],
  ),
)

// Success card
AppCard.gradient(
  child: Column(
    children: [
      Icon(AppIcons.checkCircle, size: AppIconSize.xxxl, color: AppColors.white),
      SizedBox(height: AppSpacing.md),
      Text(
        'Check-in Successful!',
        style: AppTypography.headlineMedium(context).copyWith(
          color: AppColors.white,
        ),
      ),
    ],
  ),
)
```

---

## 🎨 Component Examples

### Themed Card
```dart
AnimatedAppCard(
  onTap: () => context.push('/details'),
  child: Column(
    children: [
      Text('Title', style: AppTypography.titleMedium(context)),
      SizedBox(height: AppSpacing.sm),
      Text('Description', style: AppTypography.bodyMedium(context)),
    ],
  ),
)
```

### Gradient Card
```dart
AppCard.gradient(
  padding: EdgeInsets.all(AppSpacing.lg),
  child: Row(
    children: [
      Icon(AppIcons.trophy, color: AppColors.white, size: AppIconSize.xl),
      SizedBox(width: AppSpacing.md),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: AppTypography.titleLarge(context).copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              'Subtitle',
              style: AppTypography.bodyMedium(context).copyWith(
                color: AppColors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
)
```

### Button Variants
```dart
// Primary
AppButton.primary(
  text: 'Continue',
  icon: AppIcons.arrowForward,
  onPressed: () {},
  isFullWidth: true,
)

// Gradient
AppButton.gradient(
  text: 'Submit',
  icon: AppIcons.check,
  onPressed: () {},
)

// Outlined
AppButton.outlined(
  text: 'Cancel',
  onPressed: () {},
)

// Text button
AppButton.text(
  text: 'Skip',
  onPressed: () {},
)
```

### Stat Chips
```dart
Container(
  padding: EdgeInsets.symmetric(
    horizontal: AppSpacing.sm,
    vertical: AppSpacing.xs,
  ),
  decoration: BoxDecoration(
    color: AppColors.primaryPurpleLight.withOpacity(0.2),
    borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(AppIcons.star, size: AppIconSize.xs, color: AppColors.primaryPurple),
      SizedBox(width: AppSpacing.xs),
      Text(
        '1850 ELO',
        style: AppTypography.labelSmall(context).copyWith(
          color: AppColors.primaryPurple,
        ),
      ),
    ],
  ),
)
```

---

## 🚀 Quick Win Checklist

For each screen, do these in order:

1. ✅ **Add imports** (tokens + widgets)
2. ✅ **Update AppBar** (title style + icon)
3. ✅ **Replace padding/spacing** with AppSpacing constants
4. ✅ **Update icons** to AppIcons
5. ✅ **Replace text styles** with AppTypography
6. ✅ **Convert Card → AppCard/AnimatedAppCard**
7. ✅ **Replace buttons** with AppButton variants
8. ✅ **Add animations** (AppAnimations.fadeIn)
9. ✅ **Make responsive** (use context.isMobile, AppResponsive)
10. ✅ **Test** and adjust colors/spacing

---

## 🎯 Priority Order

1. **Leaderboard** (most visible, partially done)
2. **Club Detail** (high traffic)
3. **Event Detail** (user engagement)
4. **Create Event** (club admin flow)
5. **Check-in** (core feature)

---

## 📝 Notes

- All screens should feel **playful and modern**
- Use **gradients** for hero sections and CTAs
- Add **bounce animations** on card taps
- Keep **consistent spacing** (use the scale)
- Make everything **responsive** (no hardcoded values)
- Test on **different screen sizes** (mobile, tablet)

---

Made with 💜 by the Proof of Engagement team
