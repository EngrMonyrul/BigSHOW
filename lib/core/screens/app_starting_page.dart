import 'package:bigshow/core/providers/home_screen_provider.dart';
import 'package:bigshow/core/screens/app_access_screen.dart';
import 'package:bigshow/data/local/local_storage.dart';
import 'package:bigshow/utils/constants/others.dart';
import 'package:bigshow/utils/constants/sizes.dart';
import 'package:bigshow/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class AppStartingPage extends StatefulWidget {
  const AppStartingPage({super.key});

  @override
  State<AppStartingPage> createState() => _AppStartingPageState();
}

class _AppStartingPageState extends State<AppStartingPage> {
  final LocalStorage _localStorage = LocalStorage();
  bool internetConnected = false;
  bool checkingConnection = true;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      checkInternetConnection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomeScreenProvider>(context);
    if (checkingConnection) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 20),
              const Text(AppsStrings.checkingConnectionMsg,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    } else {
      if (internetConnected) {
        if (homePageProvider.checkingVersion) {
          return Scaffold(
              body: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 20),
              const Text(AppsStrings.checkingVersionMsg,
                  textAlign: TextAlign.center),
            ],
          )));
        } else {
          if (_localStorage.appInfo.version == "0.0.1") {
            return const AppAccessScreen(showUpdate: false);
          } else {
            return const AppAccessScreen(showUpdate: true);
          }
        }
      } else {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi,
                    color: Theme.of(context).colorScheme.primary,
                    size: AppSizes.errorIconSize),
                const Text(AppsStrings.noConnectionMsg,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      }
    }
  }

  /*-----------> Check App Version <--------------*/
  void checkAppVersion() {
    final homePageProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homePageProvider.checkingAppVersion();
    homePageProvider.fetchVideos();
  }

  /*-----------> Check Internet Connection <--------------*/
  void checkInternetConnection() async {
    final internetConnectionChecker = InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          setState(() {
            checkingConnection = false;
            internetConnected = true;
            checkAppVersion();
          });
          break;
        case InternetConnectionStatus.disconnected:
          setState(() {
            checkingConnection = false;
            internetConnected = false;
          });
          break;
      }
    });

    await Future.delayed(AppsOthersConst.connectionCheckingDelay);
    await internetConnectionChecker.cancel();
  }
}
