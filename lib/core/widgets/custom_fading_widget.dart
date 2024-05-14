import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong2,
    );
    animation = Tween<double>(
      begin: 0.2,
      end: 0.6,
    ).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
