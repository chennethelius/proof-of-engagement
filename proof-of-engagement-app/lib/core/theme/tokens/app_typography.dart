import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography system with responsive sizing
class AppTypography {
  AppTypography._();

  // Font families
  static TextStyle get _baseTextStyle => GoogleFonts.inter();
  static TextStyle get _displayTextStyle => GoogleFonts.poppins();

  // Responsive font sizing
  static double responsiveSize(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return size * 0.9;
    if (width > 600) return size * 1.1;
    return size;
  }

  // Display styles (for headers and hero text)
  static TextStyle displayLarge(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 57),
        fontWeight: FontWeight.w700,
        height: 1.12,
        letterSpacing: -0.25,
      );

  static TextStyle displayMedium(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 45),
        fontWeight: FontWeight.w700,
        height: 1.16,
      );

  static TextStyle displaySmall(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 36),
        fontWeight: FontWeight.w600,
        height: 1.22,
      );

  // Headline styles
  static TextStyle headlineLarge(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 32),
        fontWeight: FontWeight.w600,
        height: 1.25,
      );

  static TextStyle headlineMedium(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 28),
        fontWeight: FontWeight.w600,
        height: 1.29,
      );

  static TextStyle headlineSmall(BuildContext context) => _displayTextStyle.copyWith(
        fontSize: responsiveSize(context, 24),
        fontWeight: FontWeight.w600,
        height: 1.33,
      );

  // Title styles
  static TextStyle titleLarge(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 22),
        fontWeight: FontWeight.w600,
        height: 1.27,
      );

  static TextStyle titleMedium(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 16),
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0.15,
      );

  static TextStyle titleSmall(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 14),
        fontWeight: FontWeight.w600,
        height: 1.43,
        letterSpacing: 0.1,
      );

  // Body styles
  static TextStyle bodyLarge(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 16),
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.5,
      );

  static TextStyle bodyMedium(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 14),
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      );

  static TextStyle bodySmall(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 12),
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      );

  // Label styles
  static TextStyle labelLarge(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 14),
        fontWeight: FontWeight.w600,
        height: 1.43,
        letterSpacing: 0.1,
      );

  static TextStyle labelMedium(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 12),
        fontWeight: FontWeight.w600,
        height: 1.33,
        letterSpacing: 0.5,
      );

  static TextStyle labelSmall(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 11),
        fontWeight: FontWeight.w600,
        height: 1.45,
        letterSpacing: 0.5,
      );

  // Special styles
  static TextStyle button(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 14),
        fontWeight: FontWeight.w600,
        height: 1.43,
        letterSpacing: 0.1,
      );

  static TextStyle caption(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 12),
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      );

  static TextStyle overline(BuildContext context) => _baseTextStyle.copyWith(
        fontSize: responsiveSize(context, 10),
        fontWeight: FontWeight.w600,
        height: 1.6,
        letterSpacing: 1.5,
      );

  // Material TextTheme for ThemeData
  // Note: These are base sizes, will be made responsive in widgets using the methods above
  static TextTheme get textTheme => TextTheme(
        displayLarge: _displayTextStyle.copyWith(
          fontSize: 57,
          fontWeight: FontWeight.w700,
          height: 1.12,
          letterSpacing: -0.25,
        ),
        displayMedium: _displayTextStyle.copyWith(
          fontSize: 45,
          fontWeight: FontWeight.w700,
          height: 1.16,
        ),
        displaySmall: _displayTextStyle.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          height: 1.22,
        ),
        headlineLarge: _displayTextStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          height: 1.25,
        ),
        headlineMedium: _displayTextStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.29,
        ),
        headlineSmall: _displayTextStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.33,
        ),
        titleLarge: _displayTextStyle.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 1.27,
        ),
        titleMedium: _baseTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
          letterSpacing: 0.15,
        ),
        titleSmall: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        bodyLarge: _baseTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0.15,
        ),
        bodyMedium: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.43,
          letterSpacing: 0.25,
        ),
        bodySmall: _baseTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.33,
          letterSpacing: 0.4,
        ),
        labelLarge: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        labelMedium: _baseTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.33,
          letterSpacing: 0.5,
        ),
        labelSmall: _baseTextStyle.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.45,
          letterSpacing: 0.5,
        ),
      );
}
