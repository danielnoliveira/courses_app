import 'package:courses_app/app/modules/auth/pages/sign_up_page/sign_up_page_view_model.dart';
import 'package:courses_app/app/modules/auth/pages/sign_up_page/widgets/obscures_text_button.dart';
import 'package:courses_app/commons/animations/fade_animation.dart';
import 'package:courses_app/commons/animations/translate_animation.dart';
import 'package:courses_app/commons/default_checkbox.dart';
import 'package:courses_app/commons/default_text_field.dart';
import 'package:courses_app/commons/footer_texts.dart';
import 'package:courses_app/commons/label_field.dart';
import 'package:courses_app/commons/page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import '../../../../../commons/default_button.dart';

class SignupPageView extends SignupPageViewModel {
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
              CustomTranslateAnimation(
                offset: Offset(-100, 0),
                child: CustomFadeAnimation(
                    child: const PageHeader(title: 'Create a \nnew account')),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: const LabelField(label: 'Email or Phone number'),
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: DefaultTextField(
                    controller: emailTextController,
                    focusNode: emailFocus,
                    hintText: '',
                  ),
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: const LabelField(label: 'Password'),
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: ValueListenableBuilder<bool>(
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
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: const LabelField(label: 'Confirm password'),
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: ValueListenableBuilder<bool>(
                      valueListenable: isConfirmePasswordObscured,
                      builder: (context, _, __) {
                        return DefaultTextField(
                          controller: confirmPasswordTextController,
                          focusNode: confirmPasswordFocus,
                          obscureText: _,
                          sufixIcon: ObscuresTextButton(
                            isTextObscured: _,
                            onTap: () {
                              isConfirmePasswordObscured.value = !_;
                            },
                          ),
                          hintText: '',
                        );
                      }),
                ),
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: DefaultCheckbox(onChange: (p0) {}, texts: [
                    TextChild(TextChildType.normal,
                        'By creating an account, you aggree to our'),
                    TextChild(TextChildType.bold, ' Term and Conditions'),
                  ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: Row(
                    children: [
                      DefaultButton(
                        disable: false,
                        title: 'Create Account',
                        onPressed: () {
                          //
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTranslateAnimation(
                offset: Offset(0, 50),
                child: CustomFadeAnimation(
                  child: Center(
                    child: FooterText(texts: [
                      TextChild(
                          TextChildType.normal, 'Already have an account?'),
                      TextChild(
                        TextChildType.bold,
                        '  Log in',
                        onTap: () {
                          Modular.to.popAndPushNamed('/login');
                        },
                      ),
                    ]),
                  ),
                ),
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
