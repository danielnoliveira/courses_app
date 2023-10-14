import 'package:flutter/material.dart';

import 'login_page.dart';

abstract class LoginPageViewModel extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordTextController = TextEditingController();
  final passwordFocus = FocusNode();

  ValueNotifier<bool> isPasswordObscured = ValueNotifier(true);
}
