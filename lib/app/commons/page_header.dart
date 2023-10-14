import 'package:courses_app/resources/resources.dart';
import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PageHeader extends StatelessWidget {
  final String title;
  const PageHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Images.logo,
          width: 11.w,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 8.w,
            fontWeight: FontWeight.w600,
            height: 1.33,
            color: ColorsGuide.easyBlack,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorsGuide.lightBlue,
            borderRadius: BorderRadius.circular(2),
          ),
          height: 3,
          width: 7.2.w,
        )
      ],
    );
  }
}
