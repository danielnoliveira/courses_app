import 'package:courses_app/app/commons/default_button.dart';
import 'package:courses_app/resources/resources.dart';
import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CenterWelcome extends StatelessWidget {
  const CenterWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              width: 17.5.w,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'EduVerse',
              style: GoogleFonts.inter(
                fontSize: 7.7.w,
                fontWeight: FontWeight.w600,
                color: ColorsGuide.lightBlue,
                letterSpacing: -0.295,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Empowering Minds, Igniting Futures.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 4.4.w,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              DefaultButton(
                disable: false,
                title: 'Get Started',
                onPressed: () {
                  Modular.to.popAndPushNamed('/sign_up');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
