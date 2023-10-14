import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors_guide.dart';

class LabelField extends StatelessWidget {
  final String label;
  const LabelField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 3.8.w,
        fontWeight: FontWeight.w400,
        height: 1.42,
        color: ColorsGuide.lightGray,
      ),
    );
  }
}
