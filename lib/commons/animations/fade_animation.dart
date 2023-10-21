import 'package:flutter/cupertino.dart';

class CustomFadeAnimation extends StatefulWidget {
  const CustomFadeAnimation({
    Key? key,
    this.keepAlive = true,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delayDuration = const Duration(milliseconds: 0),
    this.endCallback,
    this.curve = Curves.easeIn,
  }) : super(key: key);

  final bool keepAlive;
  final Widget child;
  final Duration duration;
  final Duration delayDuration;
  final VoidCallback? endCallback;
  final Curve curve;

  @override
  State<CustomFadeAnimation> createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController animationController;
  late Animation<double> animatedValue;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animatedValue = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: widget.curve),
    );

    Future.delayed(
      widget.delayDuration,
      () {
        if (mounted) {
          animationController
              .forward()
              .whenComplete(widget.endCallback ?? () {});
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: animatedValue.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
