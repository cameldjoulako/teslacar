import 'package:flutter/material.dart';
import 'package:teslacar/widgets/adaptive_offset_effect.dart';
import 'package:teslacar/widgets/app_bar_leading.dart';
import 'package:teslacar/widgets/fade_in_effect.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_image.dart';
import 'package:teslacar/utils/styles/app_colors.dart';

class CarPageSidebar extends StatelessWidget {
  const CarPageSidebar(
    this.car, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Car car;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Hero(
      tag: '__car_${car.id}_image_bg__',
      child: Container(
        width: screenSize.width / 2,
        height: screenSize.height,
        decoration: BoxDecoration(
          color: car.bgColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
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
        child: Stack(
          children: [
            //child!,
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: CarImage(
                  car,
                  imageRotationAngle: imageRotationAngle,
                  //shadowOffset: offset * 0.5,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: AppBarLeading(
                text: 'Retour liste des voitures',
                popValue: imageRotationAngle,
              ),
            ),
          ],
        ),
      ),
    );

    /* return Container(
      width: screenSize.width / 2,
      height: screenSize.height,
      child: CarPageImageBg(
        car,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        childBuilder: (context, offset, child) => 
      ),
    ); */
  }
}
