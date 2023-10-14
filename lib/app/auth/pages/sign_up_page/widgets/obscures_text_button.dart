import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';

class ObscuresTextButton extends StatelessWidget {
  final bool isTextObscured;
  final VoidCallback onTap;
  const ObscuresTextButton(
      {super.key, required this.isTextObscured, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Icon(
        isTextObscured ? Icons.visibility : Icons.visibility_off,
        color: ColorsGuide.lightGray,
      ),
    );
  }
}
