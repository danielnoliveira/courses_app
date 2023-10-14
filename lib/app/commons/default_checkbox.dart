import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DefaultCheckbox extends StatefulWidget {
  final void Function(bool) onChange;
  final List<TextChild> texts;
  const DefaultCheckbox(
      {super.key, required this.onChange, required this.texts});

  @override
  State<DefaultCheckbox> createState() => _DefaultCheckboxState();
}

class _DefaultCheckboxState extends State<DefaultCheckbox> {
  bool defaultValue = false;

  TextStyle getTextStyle(TextChildType type, bool hasUnderline) {
    switch (type) {
      case TextChildType.bold:
        return GoogleFonts.inter(
          fontSize: 3.8.w,
          height: 1.4,
          fontWeight: FontWeight.w700,
          color: ColorsGuide.strongBlue,
          decoration:
              hasUnderline ? TextDecoration.underline : TextDecoration.none,
        );
      case TextChildType.normal:
        return GoogleFonts.inter(
          fontSize: 3.8.w,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: ColorsGuide.lightGray,
          decoration:
              hasUnderline ? TextDecoration.underline : TextDecoration.none,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onChange(!defaultValue);
        setState(() {
          defaultValue = !defaultValue;
        });
      },
      child: Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            side: MaterialStateBorderSide.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return BorderSide(width: 1, color: ColorsGuide.strongBlue);
              }
              return null;
            }),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return ColorsGuide.strongBlue;
              } else {
                return Colors.grey[50];
              }
            }),
            value: defaultValue,
            onChanged: (value) {
              widget.onChange(value ?? false);
              setState(() {
                defaultValue = value ?? false;
              });
            },
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.texts[0].onTap,
                text: widget.texts[0].content,
                children: [
                  ...widget.texts.sublist(1).map(
                        (e) => TextSpan(
                          text: e.content,
                          style: getTextStyle(e.type, e.isUnderlined),
                          recognizer: TapGestureRecognizer()..onTap = e.onTap,
                        ),
                      ),
                ],
                style: getTextStyle(
                    widget.texts[0].type, widget.texts[0].isUnderlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextChild {
  final TextChildType type;
  final String content;
  final VoidCallback? onTap;
  final bool isUnderlined;
  TextChild(this.type, this.content, {this.onTap, this.isUnderlined = false});
}

enum TextChildType { bold, normal }
