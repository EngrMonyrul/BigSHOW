import 'package:bigshow/core/screens/home_screen.dart';
import 'package:bigshow/core/screens/splash_screen.dart';
import 'package:bigshow/data/local/local_storage.dart';
import 'package:bigshow/utils/constants/others.dart';
import 'package:bigshow/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAccessScreen extends StatefulWidget {
  final bool showUpdate;

  const AppAccessScreen({super.key, required this.showUpdate});

  @override
  State<AppAccessScreen> createState() => _AppAccessScreenState();
}

class _AppAccessScreenState extends State<AppAccessScreen> {
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    LocalStorage localStorage = LocalStorage();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screenSize.height * .4),
          Center(
              child: Text(AppsStrings.appName,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary))),
          Center(
              child: Text(AppsStrings.appSlogan,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary))),
          const Spacer(),
          Visibility(
            visible: widget.showUpdate,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(localStorage.appInfo.link!));
                    },
                    child: const Text(AppsStrings.updateBtnTxt)),
                Center(
                    child: Text("${AppsStrings.appVersion} ${localStorage.appInfo.version}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary))),
                Center(
                    child: Text(AppsStrings.updateMsg,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary))),
              ],
            ),
          ),
          Visibility(
            visible: !widget.showUpdate,
            child: Center(
                child: Text("${AppsStrings.appVersion} ${localStorage.appInfo.version}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary))),
          ),
          SizedBox(height: screenSize.height * .05),
        ],
      ),
    );
  }

  /*--------------> Screen Changing Function <----------------*/
  void changeScreen() {
    if (!widget.showUpdate) {
      if(localStorage.logged){
        Future.delayed(
          AppsOthersConst.changeScreenTime,
              () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        );
      } else {
        Future.delayed(
          AppsOthersConst.changeScreenTime,
              () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SplashScreen()));
          },
        );
      }
    }
  }
}
