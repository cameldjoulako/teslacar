import 'package:flutter/material.dart';
import 'package:teslacar/widgets/animate_in_effect.dart';
import 'package:teslacar/widgets/description_item.dart';
import 'package:teslacar/models/car.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection(
    this.car, {
    Key? key,
  }) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: car.instructions.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AnimateInEffect(
          keepAlive: true,
          intervalStart: i / car.instructions.length,
          child: InstructionItem(
            car,
            index: i,
          ),
        );
      },
    );
  }
}
