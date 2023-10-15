import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'default_checkbox.dart';

class FooterText extends StatelessWidget {
  final List<TextChild> texts;
  const FooterText({
    super.key,
    required this.texts,
  }) : assert(texts.length >= 1);

  TextStyle getTextStyle(TextChildType type) {
    switch (type) {
      case TextChildType.bold:
        return GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: ColorsGuide.strongBlue,
        );
      case TextChildType.normal:
        return GoogleFonts.inter(
          fontSize: 4.4.w,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Colors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: texts[0].content,
        recognizer: TapGestureRecognizer()..onTap = texts[0].onTap,
        children: [
          ...texts.sublist(1).map(
                (e) => TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = e.onTap,
                  text: e.content,
                  style: getTextStyle(e.type),
                ),
              ),
        ],
        style: getTextStyle(texts[0].type),
      ),
    );
  }
}
