import 'package:flutter/cupertino.dart';

class CustomScaleAnimation extends StatefulWidget {
  const CustomScaleAnimation({
    Key? key,
    this.keepAlive = true,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delayDuration = const Duration(milliseconds: 0),
    this.curve = Curves.easeIn,
    this.scaleStart = 1,
    this.scaleEnd = 1,
  }) : super(key: key);

  final bool keepAlive;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final Duration delayDuration;
  final double scaleStart;
  final double scaleEnd;

  @override
  State<CustomScaleAnimation> createState() => _CustomScaleAnimationState();
}

class _CustomScaleAnimationState extends State<CustomScaleAnimation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController animationController;
  late Animation<double> animatedValue;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animatedValue =
        Tween<double>(begin: widget.scaleStart, end: widget.scaleEnd).animate(
      CurvedAnimation(parent: animationController, curve: widget.curve),
    );
    Future.delayed(
      widget.delayDuration,
      () {
        if (mounted) {
          animationController.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: animatedValue.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
