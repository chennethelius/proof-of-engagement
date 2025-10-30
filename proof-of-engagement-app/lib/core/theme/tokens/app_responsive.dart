import 'package:flutter/material.dart';

/// Responsive design utilities for adaptive layouts
class AppResponsive {
  AppResponsive._();

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  static const double largeDesktopBreakpoint = 1800;

  // Check device type
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeDesktopBreakpoint;

  // Screen size
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static Size screenSize(BuildContext context) =>
      MediaQuery.of(context).size;

  // Responsive values
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final width = screenWidth(context);
    
    if (width >= largeDesktopBreakpoint && largeDesktop != null) {
      return largeDesktop;
    } else if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    } else if (width >= mobileBreakpoint && tablet != null) {
      return tablet;
    }
    
    return mobile;
  }

  // Responsive padding
  static EdgeInsets padding({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final value = AppResponsive.value(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return EdgeInsets.all(value);
  }

  static EdgeInsets horizontalPadding({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final value = AppResponsive.value(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets verticalPadding({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final value = AppResponsive.value(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return EdgeInsets.symmetric(vertical: value);
  }

  // Safe area
  static EdgeInsets safeAreaPadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  static double safeAreaTop(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double safeAreaBottom(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  // Orientation
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Responsive font size
  static double fontSize({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return value(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Grid columns
  static int gridColumns(BuildContext context, {
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
    int largeDesktop = 5,
  }) {
    return value(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }

  // Max width for content
  static double maxContentWidth(BuildContext context) {
    return value(
      context: context,
      mobile: double.infinity,
      tablet: 720,
      desktop: 1024,
      largeDesktop: 1280,
    );
  }

  // Aspect ratios
  static double cardAspectRatio(BuildContext context) {
    return value(
      context: context,
      mobile: 16 / 9,
      tablet: 3 / 2,
      desktop: 16 / 9,
    );
  }

  // Responsive spacing
  static double spacing(BuildContext context, double base) {
    final width = screenWidth(context);
    
    if (width < 360) {
      return base * 0.85;
    } else if (width > mobileBreakpoint) {
      return base * 1.15;
    } else if (width > desktopBreakpoint) {
      return base * 1.25;
    }
    
    return base;
  }

  // Helper to build responsive layouts
  static Widget builder({
    required BuildContext context,
    required Widget Function(BuildContext context, BoxConstraints constraints) builder,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, constraints);
      },
    );
  }
}

/// Extension methods for responsive design
extension ResponsiveContext on BuildContext {
  // Device type
  bool get isMobile => AppResponsive.isMobile(this);
  bool get isTablet => AppResponsive.isTablet(this);
  bool get isDesktop => AppResponsive.isDesktop(this);
  bool get isLargeDesktop => AppResponsive.isLargeDesktop(this);

  // Screen size
  double get screenWidth => AppResponsive.screenWidth(this);
  double get screenHeight => AppResponsive.screenHeight(this);
  Size get screenSize => AppResponsive.screenSize(this);

  // Orientation
  bool get isPortrait => AppResponsive.isPortrait(this);
  bool get isLandscape => AppResponsive.isLandscape(this);

  // Safe area
  EdgeInsets get safeAreaPadding => AppResponsive.safeAreaPadding(this);
  double get safeAreaTop => AppResponsive.safeAreaTop(this);
  double get safeAreaBottom => AppResponsive.safeAreaBottom(this);

  // Max width
  double get maxContentWidth => AppResponsive.maxContentWidth(this);

  // Responsive value shorthand
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    return AppResponsive.value(
      context: this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }
}
