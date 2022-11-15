import 'package:flutter/material.dart';

class CarListItemGestureDetector extends StatefulWidget {
  const CarListItemGestureDetector({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  State<CarListItemGestureDetector> createState() =>
      _CarListItemGestureDetectorState();
}

class _CarListItemGestureDetectorState extends State<CarListItemGestureDetector>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => animationController.forward(),
      onTapCancel: () =>
          animationController.reverse(from: animationController.value),
      onTapUp: (_) => animationController.reverse(),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: widget.child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
