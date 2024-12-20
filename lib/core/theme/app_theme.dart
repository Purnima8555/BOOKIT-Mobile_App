import 'package:flutter/material.dart';

ThemeData getApplicstionTheme() {
  return ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.grey,
    fontFamily: 'Montserrat Bold Italic',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat Regular' 
        ),
        backgroundColor: Color(0xFF1E2751),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
      )
    ),
     inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: ThemeConstant.primaryColor,
          ),
      ),
    ),
  );
}
