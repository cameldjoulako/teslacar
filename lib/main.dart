import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_themes.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/cars_data.dart';
import 'package:teslacar/pages/cars_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      for (Car carItem in CarsData.carModel) {
        precacheImage(Image.asset(carItem.image).image, context);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeslaCars',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.main(),
      home: const CarsPage(),
    );
  }
}
