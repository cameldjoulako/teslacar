import 'package:flutter/material.dart';

class Car {
  final int id;
  final String title;
  final String price;
  final String date;
  final String rate;
  final String description;
  final List<String> models;
  final List<String> instructions;
  final String image;
  final String bgImageName;
  final Color bgColor;

  const Car({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.rate,
    required this.description,
    required this.models,
    required this.instructions,
    required this.image,
    required this.bgImageName,
    required this.bgColor,
  });

  String get bgImage =>
      bgImageName.isEmpty ? '' : 'assets/images/desserts/$bgImageName.png';

  String get bgImageLg =>
      bgImageName.isEmpty ? '' : 'assets/images/desserts/$bgImageName-lg.png';
}
