import 'package:courses_app/commons/default_checkbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/colors_guide.dart';

class CoursesListLabel extends StatelessWidget {
  final List<TextChild> texts;
  const CoursesListLabel({
    super.key,
    required this.texts,
  }) : assert(texts.length >= 1);

  TextStyle getTextStyle(TextChildType type) {
    switch (type) {
      case TextChildType.bold:
        return GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          color: ColorsGuide.opaqueBlue,
        );
      case TextChildType.normal:
        return GoogleFonts.inter(
          fontSize: 5.w,
          fontWeight: FontWeight.w600,
          height: 1,
          color: Colors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.5.w)
          .copyWith(top: 29),
      child: RichText(
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
      ),
    );
  }
}
