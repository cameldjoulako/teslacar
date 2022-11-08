import 'package:flutter/material.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/cars_layout.dart';
import 'package:teslacar/pages/car_page.dart';
import 'package:teslacar/widgets/car_image.dart';
import 'package:teslacar/widgets/car_list_item_gesture_detector.dart';
import 'package:teslacar/widgets/car_list_item_image_wrapper.dart';
import 'package:teslacar/widgets/car_list_item_text.dart';

class CarListItem extends StatefulWidget {
  const CarListItem(
    this.car, {
    Key? key,
  }) : super(key: key);

  final Car car;

  @override
  State<CarListItem> createState() => _CarListItemState();
}

class _CarListItemState extends State<CarListItem> {
  double carImageRotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    double imageSize = CarsLayout.of(context).carImageSize;

    return CarListItemGestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder:
                (BuildContext context, Animation<double> animation, _) {
              return CarPage(
                widget.car,
                initialImageRotationAngle: carImageRotationAngle,
              );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation, _, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        )
            .then((response) {
          if (response != null && response is double && mounted) {
            setState(() {
              carImageRotationAngle = response;
            });
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Positioned(
              child: Hero(
                tag: '__car_${widget.car.id}_image_bg__',
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.car.bgColor,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blue.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 0,
              child: CarListItemImageWrapper(
                child: CarImage(
                  widget.car,
                  imageRotationAngle: carImageRotationAngle,
                  imageSize: imageSize,
                  hasShadow: false,
                ),
              ),
            ),
            Positioned.fill(
              top: 80,
              child: CarListItemText(widget.car),
            ),
          ],
        ),
      ),
    );
  }
}
