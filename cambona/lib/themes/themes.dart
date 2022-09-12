import 'package:flutter/material.dart';

final themeDataNormal = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.blue,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurple[400],
    ),
  ),
);
