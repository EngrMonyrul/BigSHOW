import 'package:bigshow/data/models/app_info_model.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {

  final _getStorageIns = GetStorage();

  final _appInfo = "_appInfo";

  AppInfo get appInfo {
    final data = _getStorageIns.read(_appInfo);
    return data!=null ? AppInfo.fromJson(data): AppInfo();
  }
  
  void setAppVersion({required AppInfo appInfo}) {
    _getStorageIns.write(_appInfo, appInfo.toJson());
  }
}