import 'package:flutter/material.dart';
import 'package:teslacar/models/car.dart';

class CarImage extends StatelessWidget {
  const CarImage(
    this.car, {
    Key? key,
    this.imageRotationAngle = 0,
    this.imageSize,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final Car car;
  final double imageRotationAngle;
  final double? imageSize;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -148,
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'car_${car.id}_image',
                    child: Image.asset(
                      car.image,
                      width: 170,
                      height: 360,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Hero(
                    tag: 'car_${car.id}_title',
                    child: Text(
                      car.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
