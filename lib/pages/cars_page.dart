import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teslacar/utils/screen_size.dart';
import 'package:teslacar/cars_data.dart';
import 'package:teslacar/cars_layout.dart';
import 'package:teslacar/widgets/car_list_item.dart';
import 'package:teslacar/widgets/car_list_item_wrapper.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tesla Car'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse) {
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: ScreenSize.of(context).isLarge ? 5 : 3.5,
            right: ScreenSize.of(context).isLarge ? 5 : 3.5,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: CarsLayout.of(context).gridCrossAxisCount,
            childAspectRatio: CarsLayout.of(context).gridChildAspectRatio,
          ),
          itemCount: CarsData.dessertMenu.length,
          cacheExtent: 0,
          itemBuilder: (context, i) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: CarListItem(CarsData.dessertMenu[i]),
              builder: (context, ScrollDirection scrollDirection, child) {
                return CarListItemWrapper(
                  scrollDirection: scrollDirection,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
