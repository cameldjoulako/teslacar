import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teslacar/utils/screen_size.dart';
import 'package:teslacar/widgets/fade_in_effect.dart';
import 'package:teslacar/widgets/models_section.dart';
import 'package:teslacar/widgets/descriptions_section.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/car_page_sidebar.dart';
import 'package:teslacar/widgets/car_page_sliver_app_bar.dart';

class CarPage extends StatefulWidget {
  const CarPage(
    this.car, {
    Key? key,
    this.initialImageRotationAngle = 0,
  }) : super(key: key);

  final Car car;
  final double initialImageRotationAngle;

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final ScrollController scrollController = ScrollController();
  late final ValueNotifier<double> imageRotationAngleNotifier;

  void scrollListener() {
    ScrollDirection scrollDirection =
        scrollController.position.userScrollDirection;
    double scrollPosition = scrollController.position.pixels.abs();
    if (scrollDirection == ScrollDirection.forward) {
      imageRotationAngleNotifier.value +=
          (scrollPosition * math.pi / 180) * 0.01;
    } else if (scrollDirection == ScrollDirection.reverse) {
      imageRotationAngleNotifier.value -=
          (scrollPosition * math.pi / 180) * 0.01;
    }
  }

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    imageRotationAngleNotifier =
        ValueNotifier<double>(widget.initialImageRotationAngle);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    imageRotationAngleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Row(
        children: [
          if (ScreenSize.of(context).isLarge)
            Expanded(
              flex: 1,
              child: ValueListenableBuilder(
                valueListenable: imageRotationAngleNotifier,
                builder: (context, double imageRotationAngle, child) {
                  return CarPageSidebar(
                    widget.car,
                    imageRotationAngle: imageRotationAngle,
                  );
                },
              ),
            ),
          Expanded(
            flex: 1,
            child: CustomScrollView(
              controller: scrollController,
              cacheExtent: 0,
              slivers: [
                if (!ScreenSize.of(context).isLarge)
                  ValueListenableBuilder(
                    valueListenable: imageRotationAngleNotifier,
                    builder: (context, double imageRotationAngle, child) {
                      return CarPageSliverAppBar(
                        imageRotationAngle: imageRotationAngle,
                        car: widget.car,
                      );
                    },
                  ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                    vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Hero(
                        tag: '__car_${widget.car.id}_title__',
                        child: Text(
                          widget.car.title,
                          style: Theme.of(context).textTheme.headline4!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Hero(
                        tag: '__car_${widget.car.id}_description__',
                        child: Text(
                          widget.car.description,
                          style: Theme.of(context).textTheme.bodyText2!,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInEffect(
                        intervalStart: 0.5,
                        keepAlive: true,
                        child: Text(
                          'Caractéristiques',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      ModelsSection(widget.car),
                      FadeInEffect(
                        keepAlive: true,
                        child: Text(
                          'STEPS',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      InstructionsSection(widget.car),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
