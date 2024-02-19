import 'package:bigshow/core/screens/app_access_screen.dart';
import 'package:flutter/material.dart';

class AppStartingPage extends StatefulWidget {
  const AppStartingPage({super.key});

  @override
  State<AppStartingPage> createState() => _AppStartingPageState();
}

class _AppStartingPageState extends State<AppStartingPage> {
  final String _currentVersion = "0.0.1";
  @override
  Widget build(BuildContext context) {
    if(_currentVersion == "0.0.1"){
      return const AppAccessScreen();
    } else {
      return const SizedBox();
    }
  }
}
