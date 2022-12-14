import 'package:flutter/material.dart';
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
          left: 20,
          right: 0,
          bottom: 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'car_${carItem.id}_price',
                  child: Text(
                    '\$${carItem.price}',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColors.textColorFromBackground(
                              carItem.bgColor),
                          fontSize: 25,
                        ),
                  ),
                ),
                Text(
                  '/day',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 25,
                      ),
                ),
              ],
            ),
            Flexible(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 35,
                    right: 55,
                  ),
                  child: Text(
                    "D??tails",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
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
