import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teslacar/utils/styles/app_themes.dart';
import 'package:teslacar/models/recipe.dart';
import 'package:teslacar/recipes_data.dart';
import 'package:teslacar/pages/recipes_page.dart';

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
      for (Recipe menuItem in RecipesData.dessertMenu) {
        precacheImage(Image.asset(menuItem.image).image, context);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'Recipesaap',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.main(),
      home: const RecipesPage(),
    );
  }
}
