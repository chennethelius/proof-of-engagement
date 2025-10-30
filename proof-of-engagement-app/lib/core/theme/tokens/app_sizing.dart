import 'package:flutter/material.dart';

/// Responsive sizing utilities based on screen dimensions
class AppSizing {
  AppSizing._();

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  
  // Screen size checks
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }
  
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }
  
  // Screen dimensions
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  
  // Responsive values
  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }
  
  // Percentage-based sizing
  static double widthPercent(BuildContext context, double percent) {
    return screenWidth(context) * (percent / 100);
  }
  
  static double heightPercent(BuildContext context, double percent) {
    return screenHeight(context) * (percent / 100);
  }
  
  // Adaptive sizing (scales with screen width)
  static double scale(BuildContext context, double size) {
    final width = screenWidth(context);
    final baseWidth = 375.0; // iPhone X width as base
    return (size * width) / baseWidth;
  }
  
  // Safe area insets
  static EdgeInsets safeArea(BuildContext context) {
    return MediaQuery.of(context).padding;
  }
  
  // Responsive grid columns
  static int gridColumns(BuildContext context, {
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
  }) {
    return responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
  
  // Responsive max width (for centering content on large screens)
  static double maxContentWidth(BuildContext context) {
    return responsive(
      context,
      mobile: double.infinity,
      tablet: 700,
      desktop: 1200,
    );
  }
  
  // Card sizing
  static double cardHeight(BuildContext context, double ratio) {
    return widthPercent(context, 100) * ratio;
  }
  
  // Icon sizes
  static double iconSize(BuildContext context, {
    double mobile = 24,
    double? tablet,
    double? desktop,
  }) {
    return responsive(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.2,
      desktop: desktop ?? mobile * 1.4,
    );
  }
  
  // Button heights
  static double buttonHeight(BuildContext context) {
    return responsive(
      context,
      mobile: 48,
      tablet: 52,
      desktop: 56,
    );
  }
  
  // App bar height
  static double appBarHeight(BuildContext context) {
    return responsive(
      context,
      mobile: 56,
      tablet: 64,
      desktop: 72,
    );
  }
}

/// Layout constraints and dimensions
class AppLayout {
  AppLayout._();

  // Content constraints
  static BoxConstraints contentConstraints(BuildContext context) {
    return BoxConstraints(
      maxWidth: AppSizing.maxContentWidth(context),
    );
  }
  
  // Card dimensions
  static const double cardMinHeight = 120;
  static const double cardMaxHeight = 400;
  
  // List item dimensions
  static const double listItemMinHeight = 56;
  static const double listItemMaxHeight = 120;
  
  // Bottom nav height
  static const double bottomNavHeight = 80;
  
  // FAB dimensions
  static const double fabSize = 56;
  static const double fabExtendedHeight = 48;
  
  // Avatar sizes
  static const double avatarSizeSmall = 32;
  static const double avatarSizeMedium = 48;
  static const double avatarSizeLarge = 64;
  static const double avatarSizeXLarge = 96;
  
  // Image aspect ratios
  static const double aspectRatioSquare = 1.0;
  static const double aspectRatioWide = 16 / 9;
  static const double aspectRatioCard = 3 / 2;
  static const double aspectRatioPortrait = 3 / 4;
}
