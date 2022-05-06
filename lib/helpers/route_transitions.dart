import 'package:flutter/material.dart';

enum AnimationType {
  normal,
  fadeIn,
}

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  void _pushPage(Route route) => Navigator.push(context, route);

  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut)));
      },
    );
    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }
}
