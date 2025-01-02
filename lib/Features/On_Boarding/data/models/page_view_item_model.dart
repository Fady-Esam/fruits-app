import 'package:flutter/material.dart';

class PageViewItemModel {
  final String backGroundImage;
  final String image;
  final String subTitleText;
  final Widget titleWidget;

  PageViewItemModel({
    required this.backGroundImage,
    required this.image,
    required this.subTitleText,
    required this.titleWidget,
  });
}
