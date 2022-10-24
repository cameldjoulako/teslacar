import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';

class CarPageImageBg extends StatelessWidget {
  const CarPageImageBg(
    this.car, {
    Key? key,
    required this.borderRadius,
  }) : super(key: key);

  final Car car;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '__car_${car.id}_image_bg__',
      child: Container(
        decoration: BoxDecoration(
          color: car.bgColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.orangeDark.withOpacity(
                AppColors.getBrightness(car.bgColor) == Brightness.dark
                    ? 0.5
                    : 0.2,
              ),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
