import 'package:flutter/material.dart';

class AppsColorScheme {
  AppsColorScheme._();

  /*----------------> Light Theme <-------------*/
  static const lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    background: Colors.white,
    error: Colors.red,
    primary: Colors.red,
    secondary: Colors.black,
    shadow: Colors.black12,
  );

  /*----------------> Dark Theme <-------------*/
  static const darkColorScheme = ColorScheme.light(
    brightness: Brightness.dark,
    background: Colors.black,
    error: Colors.red,
    primary: Colors.red,
    secondary: Colors.white,
    shadow: Colors.black12,
  );
}
