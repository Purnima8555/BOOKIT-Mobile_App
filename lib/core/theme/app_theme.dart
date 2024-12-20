import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Primary color for appbar, buttons, etc.
    primaryColor: const Color(0xFF1E2751),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'WorkSansSemiBold',

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E2751),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: 'WorkSansSemiBold',
        fontSize: 20.0,
      ),
    ),

    // ElevatedButton theme (for buttons)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF1E2751),
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
    ),

    // Input field styling
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 19),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
      ),
      hintStyle: const TextStyle(
        fontFamily: 'WorkSansSemiBold',
        fontSize: 15.0,
        color: Colors.grey,
      ),
      labelStyle: const TextStyle(
        fontFamily: 'WorkSansSemiBold',
        fontSize: 15.0,
        color: Colors.black,
      ),
      prefixIconColor: Colors.black,
      suffixIconColor: Colors.black,
    ),
  );
}
