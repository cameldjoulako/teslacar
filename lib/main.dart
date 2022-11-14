import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_themes.dart';
import 'package:teslacar/pages/cars_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
