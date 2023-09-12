import 'package:flutter/material.dart';
import 'package:tdee/features/auth/presentation/splash_screen.dart';
import 'package:tdee/features/home/presentation/home_screen.dart';

class ScreenRoutes {
  static const String toSplashScreen = 'toSplashScreen';
  static const String toHomeScreen = 'toHomeScreen';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(builder: (_) => const SplshScreen());
      case ScreenRoutes.toHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const SplshScreen(),
        );
    }
  }
}