import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String PROFILE = '/profile';

  static void _goPage(String route) {
    navigatorKey.currentState!.pushNamed(route);
  }

  static void _backPage() {
    navigatorKey.currentState!.pop();
  }

  static void _goReplacement(String route) {
    navigatorKey.currentState!.pushReplacementNamed(route);
  }

  static void go(String route) => _goPage(route);
  static void back() => _backPage();
  static void goReplacement(String route) => _goReplacement(route);
}
