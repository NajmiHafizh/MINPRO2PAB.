import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF42A5F5),
    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF42A5F5),
      secondary: Color(0xFF42A5F5),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF42A5F5),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),

    iconTheme: const IconThemeData(color: Colors.black, size: 24),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF42A5F5),
      foregroundColor: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade100,

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black26),
      ),

      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF42A5F5), width: 2),
      ),

      labelStyle: const TextStyle(color: Colors.black54),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF42A5F5),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF42A5F5),
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF42A5F5),
      secondary: Color(0xFF42A5F5),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF42A5F5),
      foregroundColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 2,
      centerTitle: true,
    ),

    iconTheme: const IconThemeData(color: Colors.white, size: 24),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF42A5F5),
      foregroundColor: Colors.black,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1F1F1F),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color.fromARGB(60, 0, 0, 0)),
      ),

      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF42A5F5), width: 2),
      ),

      labelStyle: const TextStyle(color:  Colors.white70),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF42A5F5),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
