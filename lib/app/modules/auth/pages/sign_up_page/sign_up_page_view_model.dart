import 'package:courses_app/app/modules/auth/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

abstract class SignupPageViewModel extends State<SignupPage> {
  final emailTextController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordTextController = TextEditingController();
  final passwordFocus = FocusNode();
  final confirmPasswordTextController = TextEditingController();
  final confirmPasswordFocus = FocusNode();

  ValueNotifier<bool> isPasswordObscured = ValueNotifier(true);
  ValueNotifier<bool> isConfirmePasswordObscured = ValueNotifier(true);
}
