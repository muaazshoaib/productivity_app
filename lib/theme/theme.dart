import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // scaffold theme
      scaffoldBackgroundColor: Colors.grey[300],

      // app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // drawer theme
      drawerTheme: const DrawerThemeData(
        scrimColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 10.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
