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
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: ScreenSize.of(context).isLarge ? 40 : 20,
          bottom: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: ScreenSize.of(context).isLarge
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Hero(
              tag: '__car_${carItem.id}_title__',
              child: Text(
                carItem.price,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColors.textColorFromBackground(carItem.bgColor),
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Hero(
                tag: '__car_${carItem.id}_description__',
                child: Text(
                  carItem.description,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color:
                            AppColors.textColorFromBackground(carItem.bgColor),
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
