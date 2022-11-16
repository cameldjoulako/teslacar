import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';

class CarImage extends StatelessWidget {
  const CarImage(
    this.car, {
    Key? key,
    this.imageRotationAngle = 0,
    this.imageSize,
    this.alignment = Alignment.center,
    this.hasShadow = true,
    this.shadowOffset,
  }) : super(key: key);

  final Car car;
  final double imageRotationAngle;
  final double? imageSize;
  final AlignmentGeometry alignment;
  final bool hasShadow;
  final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (hasShadow) _buildShadow(),
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
                        //color: Colors.white,
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

  Widget _buildShadow() {
    Widget child = Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
    );

    if (shadowOffset != null) {
      child = TweenAnimationBuilder(
        tween: Tween<Offset>(begin: Offset.zero, end: shadowOffset),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        builder: (context, Offset offset, child) => Transform.translate(
          offset: offset,
          child: child,
        ),
        child: child,
      );
    }
    return child;
  }
}
