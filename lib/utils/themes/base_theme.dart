import 'package:bigshow/utils/themes/color_scheme_theme.dart';
import 'package:bigshow/utils/themes/elevated_button_theme.dart';
import 'package:bigshow/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppsBaseTheme {
  AppsBaseTheme._();

  /*---------------> Light Theme <---------------*/
  static final lightBaseTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppsTextTheme.lightTextTheme,
    elevatedButtonTheme: AppsElevatedButtonTheme.lightThemeData,
    colorScheme: AppsColorScheme.lightColorScheme,
    fontFamily: "Poppins",
  );

  /*---------------> Dark Theme <---------------*/
  static final darkBaseTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppsTextTheme.darkTextTheme,
    elevatedButtonTheme: AppsElevatedButtonTheme.darkThemeData,
    colorScheme: AppsColorScheme.darkColorScheme,
    fontFamily: "Poppins",
  );
}
