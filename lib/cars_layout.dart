import 'package:flutter/material.dart';
import 'package:teslacar/utils/screen_size.dart';

class CarsLayout {
  final BuildContext context;

  CarsLayout(this.context);

  static CarsLayout of(BuildContext context) {
    return CarsLayout(context);
  }

  int get gridCrossAxisCount {
    switch (ScreenSize.of(context)) {
      case ScreenSize.xs:
      case ScreenSize.sm:
        return 1;
      case ScreenSize.md:
        return 2;
      case ScreenSize.lg:
      case ScreenSize.xl:
      case ScreenSize.xxl:
        return 3;
    }
  }

  double get gridChildAspectRatio {
    switch (ScreenSize.of(context)) {
      case ScreenSize.xs:
      case ScreenSize.sm:
        return 1.5;
      case ScreenSize.md:
        return 2;
      case ScreenSize.lg:
        return 1.5;
      case ScreenSize.xl:
        return 1.5;
      case ScreenSize.xxl:
        return 1.5;
    }
  }

  double get carImageSize {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.45 / gridCrossAxisCount;
  }
}
