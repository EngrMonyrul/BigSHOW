import 'package:bigshow/data/models/app_info_model.dart';
import 'package:bigshow/data/models/pexels_videos.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {

  final _getStorageIns = GetStorage();

  final _appInfo = "_appInfo";
  final _alreadyLogged = "_alreadyLogged";
  final _favList = "_favList";

  // dynamic get favList => _getStorageIns.read(_favList) ?? [];
  //
  // void setFavList({required List<Video> video}) {
  //   _getStorageIns.write(_favList, video);
  // }

  bool get logged => _getStorageIns.read(_alreadyLogged) ?? false;

  void setLogged(){
    _getStorageIns.write(_alreadyLogged, true);
  }

  AppInfo get appInfo {
    final data = _getStorageIns.read(_appInfo);
    return data!=null ? AppInfo.fromJson(data): AppInfo();
  }
  
  void setAppVersion({required AppInfo appInfo}) {
    _getStorageIns.write(_appInfo, appInfo.toJson());
  }
}