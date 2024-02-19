import 'package:flutter/material.dart';

class AppsElevatedButtonTheme {
  AppsElevatedButtonTheme._();

  /*----------------> Light Theme Data <---------------*/
  static final lightThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      textStyle: const TextStyle().copyWith(fontWeight: FontWeight.bold, fontFamily: "Poppins"),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.red.withOpacity(0.1),
      disabledForegroundColor: Colors.red,
      disabledBackgroundColor: Colors.red.shade50,
    ),
  );

  /*----------------> Dark Theme Data <---------------*/
  static final darkThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      textStyle: const TextStyle().copyWith(fontWeight: FontWeight.bold, fontFamily: "Poppins"),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.red.withOpacity(0.1),
      disabledForegroundColor: Colors.red,
      disabledBackgroundColor: Colors.red.shade50,
    ),
  );
}
