import 'package:bigshow/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AppAccessScreen extends StatefulWidget {
  const AppAccessScreen({super.key});

  @override
  State<AppAccessScreen> createState() => _AppAccessScreenState();
}

class _AppAccessScreenState extends State<AppAccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screenSize.height * .4),
          Center(child: Text(AppsStrings.appName, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.primary))),
          Center(child: Text(AppsStrings.appSlogan, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary))),
          const Spacer(),
          ElevatedButton(
            onPressed: (){},
            child: const Text(AppsStrings.updateBtnTxt)),
          Center(child: Text("${AppsStrings.appVersion} 0.0.1", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary))),
          Center(child: Text(AppsStrings.updateMsg, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary))),
          SizedBox(height: screenSize.height * .05),
        ],
      ),
    );
  }
}
