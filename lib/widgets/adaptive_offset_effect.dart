import 'package:flutter/material.dart';

typedef OffsetEffectBuilder = Widget Function(
  BuildContext context,
  Offset offset,
  Widget? child,
);

class AdaptiveOffsetEffect extends StatelessWidget {
  const AdaptiveOffsetEffect({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.offsetMultiplier = 1,
    this.childBuilder,
    this.maxMovableDistance = 10,
  })  : assert(child != null),
        super(key: key);

  const AdaptiveOffsetEffect.builder({
    Key? key,
    required this.width,
    required this.height,
    this.child,
    this.offsetMultiplier = 1,
    required this.childBuilder,
    this.maxMovableDistance = 10,
  })  : assert(childBuilder != null),
        super(key: key);

  final double width;
  final double height;

  /// Moving child widget
  final Widget? child;

  /// Maximum distance allowed for the child to move in
  final double maxMovableDistance;

  /// Value to multiply the movement offset to allow some widgets
  /// to move further than the other
  final double offsetMultiplier;

  /// A builder that provides necessary data to build a moving child
  /// with its child not rebuilding with the stream
  final OffsetEffectBuilder? childBuilder;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0, -10),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, Offset offset, child) => Transform.translate(
        offset: offset,
        child: child!,
      ),
      child: child,
    );
  }
}
