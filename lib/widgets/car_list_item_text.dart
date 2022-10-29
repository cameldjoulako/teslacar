import 'package:flutter/material.dart';
import 'package:teslacar/utils/screen_size.dart';
import 'package:teslacar/utils/styles/app_colors.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_list_item_text_wrapper.dart';

class CarListItemText extends StatelessWidget {
  const CarListItemText(
    this.carItem, {
    Key? key,
  }) : super(key: key);

  final Car carItem;

  @override
  Widget build(BuildContext context) {
    return CarListItemTextWrapper(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 0,
          bottom: 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: '__car_${carItem.id}_title__',
              child: Text(
                '\$${carItem.price}',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColors.textColorFromBackground(carItem.bgColor),
                    ),
              ),
            ),
            Flexible(
              child: Hero(
                tag: '__car_${carItem.id}_description__',
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 30,
                      right: 50,
                    ),
                    child: Text(
                      "Détails",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
