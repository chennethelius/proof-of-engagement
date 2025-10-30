import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_animations.dart';

/// Themed card component with variants
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showShadow;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.variant = AppCardVariant.standard,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
    this.height,
  });

  const AppCard.gradient({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
    this.height,
  }) : variant = AppCardVariant.gradient;

  const AppCard.outlined({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.showShadow = false,
    this.width,
    this.height,
  }) : variant = AppCardVariant.outlined;

  const AppCard.elevated({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
    this.height,
  }) : variant = AppCardVariant.elevated;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.all(AppSpacing.md),
      decoration: _getDecoration(context),
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          child: card,
        ),
      );
    }

    return card;
  }

  BoxDecoration _getDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkSurface : AppColors.white;

    return switch (variant) {
      AppCardVariant.standard => BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.black.withOpacity(isDark ? 0.3 : 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
      AppCardVariant.gradient => BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
      AppCardVariant.outlined => BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: isDark ? AppColors.gray700 : AppColors.gray300,
            width: 1.5,
          ),
        ),
      AppCardVariant.elevated => BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(isDark ? 0.4 : 0.12),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
    };
  }
}

enum AppCardVariant {
  standard,
  gradient,
  outlined,
  elevated,
}

/// Animated card that scales on tap
class AnimatedAppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showShadow;
  final double? width;
  final double? height;

  const AnimatedAppCard({
    super.key,
    required this.child,
    this.onTap,
    this.variant = AppCardVariant.standard,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
    this.height,
  });

  @override
  State<AnimatedAppCard> createState() => _AnimatedAppCardState();
}

class _AnimatedAppCardState extends State<AnimatedAppCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppAnimations.fast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AppCard(
          variant: widget.variant,
          padding: widget.padding,
          margin: widget.margin,
          showShadow: widget.showShadow,
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Shimmer loading card
class ShimmerCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const ShimmerCard({
    super.key,
    this.width,
    this.height = 120,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceElevated : AppColors.gray100,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.3, end: 1.0),
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        onEnd: () {
          // Animation will loop in the parent widget
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                (isDark ? AppColors.darkSurfaceElevated : AppColors.gray100),
                (isDark ? AppColors.gray700 : AppColors.gray200),
                (isDark ? AppColors.darkSurfaceElevated : AppColors.gray100),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          ),
        ),
      ),
    );
  }
}
