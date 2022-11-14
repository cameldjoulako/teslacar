import 'package:flutter/material.dart';

class Car {
  final int id;
  final String title;
  final String price;
  final String date;
  final String rate;
  final String image;
  final String bgImageName;
  final Color bgColor;

  const Car({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.rate,
    required this.image,
    required this.bgImageName,
    required this.bgColor,
  });
}
