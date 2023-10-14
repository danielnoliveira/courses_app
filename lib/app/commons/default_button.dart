import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  bool disable;
  bool isInverted = false;
  final VoidCallback? onPressed;
  Color? mainColor;
  Color? textColor;
  int flex = 1;
  double? horizontalPadding;
  IconData? icon;
  DefaultButton(
      {Key? key,
      required this.disable,
      required this.title,
      this.isInverted = false,
      required this.onPressed,
      this.flex = 1,
      this.textColor,
      this.icon,
      this.mainColor})
      : super(key: key) {
    mainColor = mainColor ?? ColorsGuide.strongBlue;
    horizontalPadding = 32;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: AbsorbPointer(
        absorbing: disable,
        child: Opacity(
          opacity: 1.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 24, vertical: 10),
              shape: RoundedRectangleBorder(
                side: disable
                    ? BorderSide.none
                    : BorderSide(
                        width: 2,
                        color: mainColor!,
                      ),
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: isInverted ? Colors.white : mainColor,
            ),
            onPressed: disable ? null : onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      icon,
                      size: 4.2.w,
                      color: isInverted ? mainColor : textColor ?? Colors.white,
                    ),
                  ),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 4.4.w,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: isInverted ? mainColor : textColor ?? Colors.white,
                      letterSpacing: -0.08,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
