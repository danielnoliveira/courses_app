import 'package:flutter/cupertino.dart';

class CustomTranslateAnimation extends StatefulWidget {
  const CustomTranslateAnimation({
    Key? key,
    this.keepAlive = true,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delayDuration = const Duration(milliseconds: 0),
    required this.offset,
    this.curve = Curves.easeIn,
  }) : super(key: key);

  final bool keepAlive;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final Duration delayDuration;
  final Offset offset;

  @override
  State<CustomTranslateAnimation> createState() =>
      _CustomTranslateAnimationState();
}

class _CustomTranslateAnimationState extends State<CustomTranslateAnimation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController animationController;
  late Animation<Offset> animatedValue;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animatedValue =
        Tween<Offset>(begin: widget.offset, end: const Offset(0, 0)).animate(
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: widget.offset * (1 - animationController.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
