import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // scaffold theme
      scaffoldBackgroundColor: Colors.grey[300],

      // app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
      ),

      // drawer theme
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 21.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 18.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
