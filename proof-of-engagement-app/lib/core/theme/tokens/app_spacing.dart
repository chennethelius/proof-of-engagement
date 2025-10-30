import 'package:flutter/material.dart';

/// Responsive spacing system based on screen size
class AppSpacing {
  AppSpacing._();

  // Base spacing units (can scale with screen size)
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
  
  // Responsive scaling
  static double responsive(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return size * 0.9;
    if (width > 600) return size * 1.1;
    return size;
  }
  
  // Edge insets
  static EdgeInsets all(double size) => EdgeInsets.all(size);
  static EdgeInsets horizontal(double size) => EdgeInsets.symmetric(horizontal: size);
  static EdgeInsets vertical(double size) => EdgeInsets.symmetric(vertical: size);
  
  // Common padding presets
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  
  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
  static EdgeInsets screenPaddingResponsive(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return const EdgeInsets.all(12);
    if (width > 600) return const EdgeInsets.all(24);
    return screenPadding;
  }
  
  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  static const EdgeInsets cardPaddingLarge = EdgeInsets.all(lg);
  
  // List item spacing
  static const double listItemSpacing = md;
  static const double listSectionSpacing = lg;
  
  // Border radius
  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 999.0;
  
  // Border radius objects
  static BorderRadius get borderRadiusXS => BorderRadius.circular(radiusXS);
  static BorderRadius get borderRadiusSM => BorderRadius.circular(radiusSM);
  static BorderRadius get borderRadiusMD => BorderRadius.circular(radiusMD);
  static BorderRadius get borderRadiusLG => BorderRadius.circular(radiusLG);
  static BorderRadius get borderRadiusXL => BorderRadius.circular(radiusXL);
  static BorderRadius get borderRadiusXXL => BorderRadius.circular(radiusXXL);
  static BorderRadius get borderRadiusFull => BorderRadius.circular(radiusFull);
}
