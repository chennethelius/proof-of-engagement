import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tokens/app_colors.dart';
import 'tokens/app_spacing.dart';
import 'tokens/app_animations.dart';
import 'tokens/app_typography.dart';

/// Central theme configuration with playful, interactive design
class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Typography
      textTheme: AppTypography.textTheme,
      
      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryPurple,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryPurpleLight,
        onPrimaryContainer: AppColors.primaryPurpleDark,
        
        secondary: AppColors.secondaryGreen,
        onSecondary: AppColors.black,
        secondaryContainer: AppColors.secondaryGreenLight,
        onSecondaryContainer: AppColors.secondaryGreenDark,
        
        tertiary: AppColors.accentBlue,
        onTertiary: AppColors.white,
        
        error: AppColors.error,
        onError: AppColors.white,
        
        background: AppColors.gray50,
        onBackground: AppColors.gray900,
        
        surface: AppColors.white,
        onSurface: AppColors.gray900,
        surfaceVariant: AppColors.gray100,
        onSurfaceVariant: AppColors.gray700,
        
        outline: AppColors.gray300,
        outlineVariant: AppColors.gray200,
        
        shadow: AppColors.black.withOpacity(0.1),
        scrim: AppColors.black.withOpacity(0.5),
      ),
      
      // Scaffold
      scaffoldBackgroundColor: AppColors.gray50,
      
      // AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray900,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleSpacing: AppSpacing.md,
        toolbarHeight: 64,
      ),
      
      // Card
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMD,
        ),
        margin: EdgeInsets.zero,
      ),
      
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.gray300,
          disabledForegroundColor: AppColors.gray600,
          padding: AppSpacing.horizontal(AppSpacing.lg),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusLG,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),
      
      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryPurple,
          disabledForegroundColor: AppColors.gray400,
          padding: AppSpacing.horizontal(AppSpacing.lg),
          minimumSize: const Size(120, 48),
          side: const BorderSide(color: AppColors.primaryPurple, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusLG,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),
      
      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryPurple,
          disabledForegroundColor: AppColors.gray400,
          padding: AppSpacing.horizontal(AppSpacing.md),
          minimumSize: const Size(88, 40),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMD,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),
      
      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLG,
        ),
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: AppSpacing.horizontal(AppSpacing.md).copyWith(
          top: AppSpacing.md,
          bottom: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      
      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.gray100,
        disabledColor: AppColors.gray200,
        selectedColor: AppColors.primaryPurpleLight,
        secondarySelectedColor: AppColors.secondaryGreenLight,
        padding: AppSpacing.horizontal(AppSpacing.sm).copyWith(
          top: AppSpacing.sm,
          bottom: AppSpacing.sm,
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMD,
        ),
      ),
      
      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXL,
        ),
      ),
      
      // Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXL),
          ),
        ),
      ),
      
      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.gray900,
        contentTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMD,
        ),
      ),
      
      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryPurple,
        circularTrackColor: AppColors.gray200,
        linearTrackColor: AppColors.gray200,
      ),
      
      // Page Transitions
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: AppAnimations.pageTransition,
          TargetPlatform.iOS: AppAnimations.pageTransition,
        },
      ),
      
      // Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.gray200,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Typography
      textTheme: AppTypography.textTheme,
      
      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryPurpleLight,
        onPrimary: AppColors.black,
        primaryContainer: AppColors.primaryPurpleDark,
        onPrimaryContainer: AppColors.primaryPurpleLight,
        
        secondary: AppColors.secondaryGreen,
        onSecondary: AppColors.black,
        secondaryContainer: AppColors.secondaryGreenDark,
        onSecondaryContainer: AppColors.secondaryGreenLight,
        
        tertiary: AppColors.accentBlue,
        onTertiary: AppColors.black,
        
        error: AppColors.error,
        onError: AppColors.black,
        
        background: AppColors.darkBackground,
        onBackground: AppColors.white,
        
        surface: AppColors.darkSurface,
        onSurface: AppColors.white,
        surfaceVariant: AppColors.darkSurfaceElevated,
        onSurfaceVariant: AppColors.gray300,
        
        outline: AppColors.gray700,
        outlineVariant: AppColors.gray800,
        
        shadow: AppColors.black.withOpacity(0.3),
        scrim: AppColors.black.withOpacity(0.7),
      ),
      
      // Scaffold
      scaffoldBackgroundColor: AppColors.darkBackground,
      
      // AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleSpacing: AppSpacing.md,
        toolbarHeight: 64,
      ),
      
      // Card
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.darkSurface,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMD,
        ),
        margin: EdgeInsets.zero,
      ),
      
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryPurpleLight,
          foregroundColor: AppColors.black,
          disabledBackgroundColor: AppColors.gray700,
          disabledForegroundColor: AppColors.gray500,
          padding: AppSpacing.horizontal(AppSpacing.lg),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusLG,
          ),
        ),
      ),
      
      // Rest of dark theme follows same pattern...
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: AppAnimations.pageTransition,
          TargetPlatform.iOS: AppAnimations.pageTransition,
        },
      ),
      
      dividerTheme: const DividerThemeData(
        color: AppColors.gray700,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
