import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/widgets/adaptive_offset_effect.dart';
import 'package:teslacar/widgets/app_bar_leading.dart';
import 'package:teslacar/widgets/fade_in_effect.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_image.dart';
import 'package:teslacar/widgets/car_image_pattern.dart';
import 'package:teslacar/widgets/car_page_image_bg.dart';

class CarPageSliverAppBar extends StatelessWidget {
  const CarPageSliverAppBar({
    Key? key,
    required this.car,
    this.expandedHeight = 340,
    this.collapsedHeight = 200,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Car car;
  final double expandedHeight;
  final double? collapsedHeight;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.7;

    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      collapsedHeight: collapsedHeight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: AppColors.getBrightness(car.bgColor),
      ),
      leading: AppBarLeading(
        popValue: imageRotationAngle,
        bgColor: AppColors.textColorFromBackground(car.bgColor),
      ),
      expandedHeight: expandedHeight + MediaQuery.of(context).padding.top,
      flexibleSpace: AdaptiveOffsetEffect.builder(
        width: MediaQuery.of(context).size.width,
        height: expandedHeight,
        child: CarPageImageBg(
          car,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        childBuilder: (BuildContext context, Offset offset, Widget? child) {
          return Stack(
            children: [
              child!,
              if (car.bgImage.isNotEmpty)
                FlexibleSpaceBar(
                  background: FadeInEffect(
                    intervalStart: 0.5,
                    child: Opacity(
                      opacity: 0.6,
                      child: CarImagePattern(
                        offset: offset,
                        car,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CarImage(
                    car,
                    imageRotationAngle: imageRotationAngle,
                    imageSize: imageSize,
                    shadowOffset: offset * 0.6,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
