import 'package:bigshow/core/screens/app_access_screen.dart';
import 'package:bigshow/core/screens/app_starting_page.dart';
import 'package:bigshow/utils/themes/base_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppsBaseTheme.lightBaseTheme,
      darkTheme: AppsBaseTheme.darkBaseTheme,
      themeMode: ThemeMode.system,
      home: const AppStartingPage(),
    );
  }
}
