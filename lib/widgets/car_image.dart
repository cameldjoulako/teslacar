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
      child: Hero(
        tag: '__car_${car.id}_image__',
        // Todo: MAYBE add a TweenAnimationBuilder for smoother animation??
        child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (hasShadow) _buildShadow(),
              Positioned.fill(
                top:-50,
                child: Transform.rotate(
                  angle: imageRotationAngle,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          car.image,
                          width: imageSize,
                        ),
                        Text(car.title,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        
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
