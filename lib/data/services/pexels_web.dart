import 'dart:convert';
import 'dart:developer';

import 'package:bigshow/data/models/pexels_videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PexelsWebServices {
  final baseUrl =
      "https://api.pexels.com/videos/search?query=nature&per_page=100";
  var headers = {
    "Authorization": "xsy4y1E3ngPAVZ70tqIfU91PImdpjPntmVnHc6SaMlvY9EWFstm72h1m"
  };

  /*-------------> Fetch Videos <-------------*/
  Future<PexelsVideos> fetchVideos() async {
    try {
      final url = Uri.parse(baseUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      if(response.statusCode == 200) {
        PexelsVideos pexelsVideos = PexelsVideos.fromJson(jsonDecode(response.body));
        return pexelsVideos;
      } else {
        return PexelsVideos();
      }
    } catch (e) {
      rethrow;
    }
  }
}
