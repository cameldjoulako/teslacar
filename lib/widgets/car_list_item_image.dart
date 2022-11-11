import 'package:flutter/material.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_list_item_image_wrapper.dart';

class CarListItemImage extends StatelessWidget {
  const CarListItemImage(
    this.car, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Car car;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = 300;

    return CarListItemImageWrapper(
      child: Hero(
        tag: '__car_${car.id}_image__',
        child: Transform.rotate(
          angle: imageRotationAngle,
          child: Image.asset(
            car.image,
            width: imageSize,
          ),
        ),
      ),
    );
  }
}
