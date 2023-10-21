import 'package:courses_app/app/modules/auth/pages/splash_page/splash_page_view_model.dart';
import 'package:courses_app/app/modules/auth/pages/splash_page/widgets/center_welcome.dart';
import 'package:courses_app/resources/resources.dart';
import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../commons/animations/fade_animation.dart';
import '../../../../../commons/animations/translate_animation.dart';

class SplashPageView extends SplashPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ColorsGuide.splashGradient,
            stops: [-0.0774, 1.026],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const CustomFadeAnimation(
              curve: Curves.easeInCubic,
              child: CenterWelcome(),
              duration: Duration(milliseconds: 1000),
            ),
            const Spacer(),
            CustomTranslateAnimation(
              duration: Duration(milliseconds: 750),
              curve: Curves.easeInCubic,
              offset: const Offset(0, 300),
              child: CustomFadeAnimation(
                duration: Duration(milliseconds: 750),
                curve: Curves.easeInCubic,
                child: SvgPicture.asset(
                  Svgs.kidStudying,
                  width: 100.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
