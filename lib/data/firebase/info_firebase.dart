import 'dart:convert';

import 'package:bigshow/data/models/app_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class InfoFirebase {

  /*------------> Checking App Version <------------*/
  Future<AppInfo> getAppVersion () async {
    try{
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("imp").doc("inter").get();
      AppInfo appInfo = AppInfo.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      return appInfo;
    } catch (e) {
      rethrow;
    }
  }
}