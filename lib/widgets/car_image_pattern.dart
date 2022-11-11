import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';

class CarImagePattern extends StatelessWidget {
  const CarImagePattern(
    this.car, {
    Key? key,
    this.offset = Offset.zero,
    required this.borderRadius,
  }) : super(key: key);

  final Car car;
  final BorderRadius borderRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    String bgImage = car.bgImage;
    AlignmentGeometry alignment = Alignment.bottomCenter;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: offset * 1.5),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          builder: (context, Offset offset, child) => Transform.translate(
            offset: offset,
            child: child!,
          ),
          child: Align(
            alignment: alignment,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                child: Image.asset(
                  bgImage,
                  color: AppColors.orangeDark.withOpacity(0.5),
                  alignment: alignment,
                ),
              ),
            ),
          ),
        ),
        TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: offset),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          builder: (context, Offset offset, child) => Transform.translate(
            offset: offset,
            child: child!,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage),
                  alignment: alignment,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
