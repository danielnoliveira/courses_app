import 'package:courses_app/app/auth/pages/login_page/login_page.dart';
import 'package:courses_app/app/auth/pages/sign_up_page/sign_up_page.dart';
import 'package:courses_app/app/auth/pages/splash_page/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SplashPage(),
    );
    r.child(
      '/login',
      child: (context) => const LoginPage(),
    );
    r.child(
      '/sign_up',
      child: (context) => const SignupPage(),
    );
  }
}
