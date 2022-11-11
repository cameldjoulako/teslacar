import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teslacar/cars_data.dart';
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
        title: const Text(
          'Choisir une Voiture',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: const [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 33,
            ),
            onPressed: null,
          )
        ],
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
          padding: const EdgeInsets.only(
            left: 3.5,
            right: 3.5,
            top: 10,
            bottom: 10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
          ),
          itemCount: CarsData.carModel.length,
          cacheExtent: 0,
          itemBuilder: (context, i) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: CarListItem(CarsData.carModel[i]),
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
