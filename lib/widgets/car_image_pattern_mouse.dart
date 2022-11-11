import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';

class CarImagePatternMouse extends StatelessWidget {
  const CarImagePatternMouse(
    this.car, {
    Key? key,
    required this.borderRadius,
    this.offset = Offset.zero,
  }) : super(key: key);

  final Car car;
  final BorderRadius borderRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    String bgImage = car.bgImage;
    AlignmentGeometry alignment = Alignment.bottomCenter;

    return Opacity(
      opacity: 0.6,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TweenAnimationBuilder(
            tween: Tween<Offset>(begin: Offset.zero, end: offset * 2),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, Offset offset, child) => Transform.translate(
              offset: offset,
              child: child,
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
          TweenAnimationBuilder(
            tween: Tween<Offset>(begin: Offset.zero, end: offset),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, Offset offset, child) => Transform.translate(
              offset: offset,
              child: child,
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
      ),
    );
  }
}
