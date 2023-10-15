import 'package:courses_app/app/modules/auth/pages/login_page/login_page.dart';
import 'package:courses_app/app/modules/auth/pages/sign_up_page/sign_up_page.dart';
import 'package:courses_app/app/modules/auth/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/colors_guide.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorsGuide.splashGradient.first,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        return const SplashPage();
      },
    );
    r.child(
      '/login',
      child: (context) => const LoginPage(),
    );
    r.child(
      '/sign_up',
      child: (context) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        return const SignupPage();
      },
    );
  }
}
