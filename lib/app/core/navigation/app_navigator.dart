import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String PROFILE = '/profile';

  void _goPage(String route) {
    Navigator.pushNamed(navigatorKey.currentState!.context, route);
  }

  void _backPage() {
    Navigator.pop(navigatorKey.currentState!.context);
  }

  void _goReplacement(String route) {
    Navigator.pushReplacementNamed(navigatorKey.currentState!.context, route);
  }

  void go(String route) => _goPage(route);
  void back() => _backPage();
  void goReplacement(String route) => _goReplacement(route);
}
