import 'package:flutter/material.dart';
import 'package:teslacar/widgets/adaptive_offset_effect.dart';
import 'package:teslacar/widgets/app_bar_leading.dart';
import 'package:teslacar/widgets/fade_in_effect.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_image.dart';
import 'package:teslacar/widgets/car_image_pattern_mouse.dart';
import 'package:teslacar/widgets/car_page_image_bg.dart';

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

    return Container(
      width: screenSize.width / 2,
      height: screenSize.height,
      child: CarPageImageBg(
        car,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      /* childBuilder: (context, offset, child) => Stack(
        children: [
          child!,
          if (car.bgImageName.isNotEmpty)
            FadeInEffect(
              intervalStart: 0.5,
              child: CarImagePatternMouse(
                car,
                offset: offset,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: CarImage(
                  car,
                  imageRotationAngle: imageRotationAngle,
                  shadowOffset: offset * 0.5,
                ),
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
      ), */
    );
  }
}
