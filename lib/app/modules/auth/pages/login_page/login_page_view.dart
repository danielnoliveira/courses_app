import 'package:courses_app/app/modules/auth/pages/login_page/login_page_view_model.dart';
import 'package:courses_app/commons/page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import '../../../../../commons/default_button.dart';
import '../../../../../commons/default_checkbox.dart';
import '../../../../../commons/default_text_field.dart';
import '../../../../../commons/footer_texts.dart';
import '../../../../../commons/label_field.dart';
import '../sign_up_page/widgets/obscures_text_button.dart';

class LoginPageView extends LoginPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const PageHeader(title: 'Log in'),
              const SizedBox(
                height: 30,
              ),
              const LabelField(label: 'Email or Phone number'),
              DefaultTextField(
                controller: emailTextController,
                focusNode: emailFocus,
                hintText: '',
              ),
              const LabelField(label: 'Password'),
              ValueListenableBuilder<bool>(
                  valueListenable: isPasswordObscured,
                  builder: (context, _, __) {
                    return DefaultTextField(
                      controller: passwordTextController,
                      focusNode: passwordFocus,
                      obscureText: _,
                      hintText: '',
                      sufixIcon: ObscuresTextButton(
                        isTextObscured: _,
                        onTap: () {
                          isPasswordObscured.value = !_;
                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  DefaultButton(
                    disable: false,
                    title: 'Log In',
                    onPressed: () {
                      Modular.to.popAndPushNamed('/home/');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: FooterText(texts: [
                  TextChild(TextChildType.normal, 'Don\'t have an account?'),
                  TextChild(
                    TextChildType.bold,
                    '  Sign up',
                    onTap: () {
                      Modular.to.popAndPushNamed('/sign_up');
                    },
                  ),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
