import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class VideoDataModel {
  List<VideoDataDetailModel>videoData;
  String mvTitle;
  int prevClickIndex;


  VideoDataModel({
    required this.mvTitle,
    required this.prevClickIndex,
    required this.videoData
  });
}

class VideoDataDetailModel{
  String videoTitle;
  String company;
  String companyImg;
  String viewCount;
  String thumbnail;
  String url;
  bool check;
  bool favorite;

  VideoDataDetailModel({
    required this.favorite,
    required this.check,
    required this.thumbnail,
    required this.url,
    required this.company,
    required this.companyImg,
    required this.videoTitle,
    required this.viewCount,
  });
}