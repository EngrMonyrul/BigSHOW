import 'package:bigshow/data/firebase/info_firebase.dart';
import 'package:bigshow/data/local/local_storage.dart';
import 'package:flutter/foundation.dart';

class HomeScreenProvider extends ChangeNotifier {
  /*-------------> Object Declaring <--------------*/
  final LocalStorage _localStorage = LocalStorage();
  final InfoFirebase _infoFirebase = InfoFirebase();
  bool _checkingVersion = true;

  /*-------------> Returning Objects <--------------*/
  bool get checkingVersion => _checkingVersion;

  /*-------------> Checking App Version <------------*/
  void checkingAppVersion() {
    _infoFirebase.getAppVersion().then((value) {
      _localStorage.setAppVersion(appInfo: value);
    });
    _checkingVersion = false;
    notifyListeners();
  }
}
