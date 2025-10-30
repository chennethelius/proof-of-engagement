import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_animations.dart';
import '../tokens/app_typography.dart';

/// Themed button variants with playful interactions
class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final IconData? suffixIcon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  });

  // Named constructors for convenience
  const AppButton.primary({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  }) : variant = AppButtonVariant.primary;

  const AppButton.secondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  }) : variant = AppButtonVariant.secondary;

  const AppButton.outlined({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  }) : variant = AppButtonVariant.outlined;

  const AppButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  }) : variant = AppButtonVariant.text;

  const AppButton.gradient({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.suffixIcon,
  }) : variant = AppButtonVariant.gradient;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppAnimations.fast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onPressed != null && !widget.isLoading) {
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.onPressed == null || widget.isLoading;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: isDisabled ? null : widget.onPressed,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.isFullWidth ? double.infinity : null,
          height: _getHeight(),
          decoration: _getDecoration(isDisabled),
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
          child: widget.isLoading
              ? Center(
                  child: SizedBox(
                    width: _getLoadingSize(),
                    height: _getLoadingSize(),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getLoadingColor(isDisabled),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        size: _getIconSize(),
                        color: _getTextColor(isDisabled),
                      ),
                      SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      widget.text,
                      style: _getTextStyle(context, isDisabled),
                    ),
                    if (widget.suffixIcon != null) ...[
                      SizedBox(width: AppSpacing.sm),
                      Icon(
                        widget.suffixIcon,
                        size: _getIconSize(),
                        color: _getTextColor(isDisabled),
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  double _getHeight() {
    return switch (widget.size) {
      AppButtonSize.small => 36,
      AppButtonSize.medium => 48,
      AppButtonSize.large => 56,
    };
  }

  double _getHorizontalPadding() {
    return switch (widget.size) {
      AppButtonSize.small => AppSpacing.md,
      AppButtonSize.medium => AppSpacing.lg,
      AppButtonSize.large => AppSpacing.xl,
    };
  }

  double _getVerticalPadding() {
    return switch (widget.size) {
      AppButtonSize.small => AppSpacing.sm,
      AppButtonSize.medium => AppSpacing.md,
      AppButtonSize.large => AppSpacing.md,
    };
  }

  double _getIconSize() {
    return switch (widget.size) {
      AppButtonSize.small => 16,
      AppButtonSize.medium => 20,
      AppButtonSize.large => 24,
    };
  }

  double _getLoadingSize() {
    return switch (widget.size) {
      AppButtonSize.small => 16,
      AppButtonSize.medium => 20,
      AppButtonSize.large => 24,
    };
  }

  BoxDecoration _getDecoration(bool isDisabled) {
    final borderRadius = BorderRadius.circular(
      widget.size == AppButtonSize.small ? AppSpacing.radiusMD : AppSpacing.radiusLG,
    );

    return switch (widget.variant) {
      AppButtonVariant.primary => BoxDecoration(
          color: isDisabled ? AppColors.gray300 : AppColors.primaryPurple,
          borderRadius: borderRadius,
          boxShadow: isDisabled
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
      AppButtonVariant.secondary => BoxDecoration(
          color: isDisabled ? AppColors.gray300 : AppColors.secondaryGreen,
          borderRadius: borderRadius,
          boxShadow: isDisabled
              ? null
              : [
                  BoxShadow(
                    color: AppColors.secondaryGreen.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
      AppButtonVariant.outlined => BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
          border: Border.all(
            color: isDisabled ? AppColors.gray300 : AppColors.primaryPurple,
            width: 2,
          ),
        ),
      AppButtonVariant.text => BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
        ),
      AppButtonVariant.gradient => BoxDecoration(
          gradient: isDisabled ? null : AppColors.primaryGradient,
          color: isDisabled ? AppColors.gray300 : null,
          borderRadius: borderRadius,
          boxShadow: isDisabled
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
    };
  }

  Color _getTextColor(bool isDisabled) {
    if (isDisabled) {
      return AppColors.gray600;
    }

    return switch (widget.variant) {
      AppButtonVariant.primary => AppColors.white,
      AppButtonVariant.secondary => AppColors.black,
      AppButtonVariant.outlined => AppColors.primaryPurple,
      AppButtonVariant.text => AppColors.primaryPurple,
      AppButtonVariant.gradient => AppColors.white,
    };
  }

  Color _getLoadingColor(bool isDisabled) {
    if (isDisabled) {
      return AppColors.gray600;
    }

    return switch (widget.variant) {
      AppButtonVariant.primary => AppColors.white,
      AppButtonVariant.secondary => AppColors.black,
      AppButtonVariant.outlined => AppColors.primaryPurple,
      AppButtonVariant.text => AppColors.primaryPurple,
      AppButtonVariant.gradient => AppColors.white,
    };
  }

  TextStyle _getTextStyle(BuildContext context, bool isDisabled) {
    final baseStyle = switch (widget.size) {
      AppButtonSize.small => AppTypography.labelMedium(context),
      AppButtonSize.medium => AppTypography.labelLarge(context),
      AppButtonSize.large => AppTypography.titleMedium(context),
    };

    return baseStyle.copyWith(
      color: _getTextColor(isDisabled),
      fontWeight: FontWeight.w600,
    );
  }
}

enum AppButtonVariant {
  primary,
  secondary,
  outlined,
  text,
  gradient,
}

enum AppButtonSize {
  small,
  medium,
  large,
}
