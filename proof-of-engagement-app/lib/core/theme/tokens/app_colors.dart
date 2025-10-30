import 'package:flutter/material.dart';

/// Playful color palette inspired by Web3 and blockchain aesthetics
class AppColors {
  AppColors._();

  // Primary - Vibrant Purple (Solana inspired)
  static const Color primaryPurple = Color(0xFF9945FF);
  static const Color primaryPurpleLight = Color(0xFFB877FF);
  static const Color primaryPurpleDark = Color(0xFF7A28CC);
  
  // Secondary - Electric Green
  static const Color secondaryGreen = Color(0xFF14F195);
  static const Color secondaryGreenLight = Color(0xFF4FFBB3);
  static const Color secondaryGreenDark = Color(0xFF00C076);
  
  // Accent Colors - Playful and vibrant
  static const Color accentBlue = Color(0xFF00D4FF);
  static const Color accentPink = Color(0xFFFF6B9D);
  static const Color accentOrange = Color(0xFFFF8A00);
  static const Color accentYellow = Color(0xFFFFD700);
  
  // Neutral - Modern grays
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);
  
  // Dark mode specific
  static const Color darkBackground = Color(0xFF0A0A0F);
  static const Color darkSurface = Color(0xFF1A1A24);
  static const Color darkSurfaceElevated = Color(0xFF252532);
  
  // Semantic Colors
  static const Color success = Color(0xFF00C853);
  static const Color warning = Color(0xFFFFAB00);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF2979FF);
  
  // Rank Colors (for leaderboard)
  static const Color rankGold = Color(0xFFFFD700);
  static const Color rankSilver = Color(0xFFC0C0C0);
  static const Color rankBronze = Color(0xFFCD7F32);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, secondaryGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient heroGradient = LinearGradient(
    colors: [primaryPurpleDark, primaryPurple, accentBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF9945FF), Color(0xFF7A28CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Overlays
  static Color overlay(double opacity) => black.withOpacity(opacity);
  static Color shimmer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? white.withOpacity(0.1) : black.withOpacity(0.05);
  }
}
