import 'package:flutter/material.dart';
import 'package:teslacar/widgets/animate_in_effect.dart';
import 'package:teslacar/widgets/instruction_item.dart';
import 'package:teslacar/models/recipe.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipe.instructions.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AnimateInEffect(
          keepAlive: true,
          intervalStart: i / recipe.instructions.length,
          child: InstructionItem(
            recipe,
            index: i,
          ),
        );
      },
    );
  }
}
