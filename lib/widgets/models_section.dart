import 'package:flutter/material.dart';
import 'package:teslacar/widgets/animate_in_effect.dart';
import 'package:teslacar/widgets/model_item.dart';
import 'package:teslacar/models/car.dart';

class ModelsSection extends StatelessWidget {
  //Model de voiture
  const ModelsSection(
    this.car, {
    Key? key,
  }) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: car.models.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AnimateInEffect(
          keepAlive: true,
          intervalStart: i / car.models.length,
          child: ModelItem(
            car,
            model: car.models[i],
          ),
        );
      },
    );
  }
}
