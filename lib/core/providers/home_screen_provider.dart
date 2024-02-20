import 'dart:developer';

import 'package:bigshow/data/firebase/info_firebase.dart';
import 'package:bigshow/data/local/local_storage.dart';
import 'package:bigshow/data/models/app_info_model.dart';
import 'package:bigshow/data/models/pexels_videos.dart';
import 'package:bigshow/data/services/pexels_web.dart';
import 'package:flutter/foundation.dart';

class HomeScreenProvider extends ChangeNotifier {
  /*-------------> Object Declaring <--------------*/
  final LocalStorage _localStorage = LocalStorage();
  final InfoFirebase _infoFirebase = InfoFirebase();
  final PexelsWebServices _pexelsWebServices = PexelsWebServices();
  bool _checkingVersion = true;
  PexelsVideos _pexelsVideos = PexelsVideos();
  bool _fetchingData = true;
  List<Video> _favList = [];

  /*-------------> Returning Objects <--------------*/
  bool get checkingVersion => _checkingVersion;
  PexelsVideos get pexelsVideos => _pexelsVideos;
  bool get fetchingData => _fetchingData;
  List<Video> get favList => _favList;

  /*-------------> Checking App Version <------------*/
  void checkingAppVersion() {
    _infoFirebase.getAppVersion().then((value) {
      _localStorage.setAppVersion(appInfo: value);
    });
    _checkingVersion = false;
    notifyListeners();
  }

  void fetchVideos() async {
    _pexelsVideos = await _pexelsWebServices.fetchVideos();
    _fetchingData = false;
    debugPrint(_pexelsVideos.toJson().toString());
    notifyListeners();
  }

  List<Video> searchEnginee({required String value}){
    return _pexelsVideos.videos!.where((element) => element.user!.name!.toLowerCase().contains(value.toLowerCase())).toList();
  }

  void setFavList({required Video value}) {
    _favList.add(value);
    notifyListeners();
  }

  void removeFavList({required Video video}){
    _favList.remove(video);
    notifyListeners();
  }

}
