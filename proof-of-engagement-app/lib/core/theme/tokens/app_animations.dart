import 'package:flutter/material.dart';

/// Smooth, playful animations and transitions
class AppAnimations {
  AppAnimations._();

  // Duration presets
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration slower = Duration(milliseconds: 500);
  
  // Curves
  static const Curve defaultCurve = Curves.easeInOutCubic;
  static const Curve bounceCurve = Curves.elasticOut;
  static const Curve smoothCurve = Curves.easeOutQuart;
  static const Curve snapCurve = Curves.easeOutExpo;
  
  // Page transitions
  static PageTransitionsBuilder get pageTransition => const ZoomPageTransitionsBuilder();
  
  static Route<T> fadeRoute<T>({
    required Widget page,
    Duration duration = normal,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
  
  static Route<T> slideRoute<T>({
    required Widget page,
    Duration duration = normal,
    Offset begin = const Offset(1.0, 0.0),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: begin, end: Offset.zero).chain(
          CurveTween(curve: smoothCurve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  
  static Route<T> scaleRoute<T>({
    required Widget page,
    Duration duration = normal,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.8, end: 1.0).chain(
          CurveTween(curve: snapCurve),
        );
        return ScaleTransition(
          scale: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
  
  // Animated widgets helpers
  static Widget fadeIn({
    required Widget child,
    Duration duration = normal,
    Duration delay = Duration.zero,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: defaultCurve,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: child,
    );
  }
  
  static Widget slideIn({
    required Widget child,
    Duration duration = normal,
    Offset begin = const Offset(0, 20),
  }) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: Offset.zero),
      duration: duration,
      curve: smoothCurve,
      builder: (context, value, child) => Transform.translate(
        offset: value,
        child: child,
      ),
      child: child,
    );
  }
  
  static Widget scaleIn({
    required Widget child,
    Duration duration = normal,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: duration,
      curve: snapCurve,
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: child,
    );
  }
  
  // Shimmer animation for loading states
  static Widget shimmer({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
    Color? baseColor,
    Color? highlightColor,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -2.0, end: 2.0),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                baseColor ?? Colors.grey[300]!,
                highlightColor ?? Colors.grey[100]!,
                baseColor ?? Colors.grey[300]!,
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: GradientRotation(value),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: child,
      onEnd: () {
        // Repeat animation
      },
    );
  }
  
  // Hero animation tags
  static String heroTag(String id, String type) => '${type}_$id';
  
  // Stagger animation delays
  static Duration staggerDelay(int index, {Duration base = fast}) {
    return Duration(milliseconds: base.inMilliseconds + (index * 50));
  }
}

/// Interactive effects for buttons and cards
class AppEffects {
  AppEffects._();

  // Shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];
  
  static List<BoxShadow> get cardShadowHover => [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];
  
  static List<BoxShadow> get buttonShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
  
  static List<BoxShadow> glowShadow(Color color) => [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 16,
          spreadRadius: 2,
        ),
      ];
  
  // Haptic feedback
  static void lightImpact() {
    // HapticFeedback.lightImpact();
  }
  
  static void mediumImpact() {
    // HapticFeedback.mediumImpact();
  }
  
  static void heavyImpact() {
    // HapticFeedback.heavyImpact();
  }
  
  static void selectionClick() {
    // HapticFeedback.selectionClick();
  }
}
