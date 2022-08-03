import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/providers/login_page_provider.dart';

import 'package:movie_wtc/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const pageName = 'login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lineWidth = MediaQuery.of(context).size.width / 375.0 * 100.0;
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => LoginPageProvider(),
          child: Consumer<LoginPageProvider>(
            builder: (context, loginPageProvider, child) {
              var state = loginPageProvider.state == LoginState.login;

              final String loginText =
                  'loginPage'.tr(gender: state ? 'login' : 'signup');
              // final String haveAccount =
              //     'haveAccount'.tr(gender: state ? 'dontHave' : 'have');

              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 48),
                children: [
                  SizedBox(
                      height: 72,
                      child: Image.asset(
                        'assets/icons/icon_app_big.png',
                        fit: BoxFit.fitHeight,
                      )),
                  const SizedBox(height: 16),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 400),
                    crossFadeState: loginPageProvider.state == LoginState.login
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: loginPart(context, loginText),
                    secondChild: signUpPart(context, loginText),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 58.0),
                    child: SizedBox(
                      height: 18,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: lineWidth,
                            color: CustomColors.of(context).primary,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              'or'.tr(),
                              style: CustomTextStyles.of(context).extraBold15,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: lineWidth,
                            color: CustomColors.of(context).primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSocialMediaButton(
                          context: context,
                          imagePath: 'assets/icons/icon_facebook.png',
                        ),
                        const SizedBox(width: 40),
                        buildSocialMediaButton(
                          context: context,
                          imagePath: 'assets/icons/icon_twitter.png',
                        ),
                        const SizedBox(width: 40),
                        buildSocialMediaButton(
                          context: context,
                          imagePath: 'assets/icons/icon_email.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 400),
                      crossFadeState:
                          loginPageProvider.state == LoginState.login
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      firstChild: Text.rich(
                        TextSpan(
                          text: 'no_account'.tr(),
                          children: [
                            TextSpan(
                              text: 'signup'.tr(),
                              style: CustomTextStyles.of(context)
                                  .regular13
                                  .apply(
                                      color: CustomColors.of(context).primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  loginPageProvider.toggleState();
                                },
                            ),
                          ],
                        ),
                        style: CustomTextStyles.of(context).regular13,
                      ),
                      secondChild: Text.rich(
                        TextSpan(
                          text: 'has_account'.tr(),
                          children: [
                            TextSpan(
                              text: 'login'.tr(),
                              style: CustomTextStyles.of(context)
                                  .regular13
                                  .apply(
                                      color: CustomColors.of(context).primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  loginPageProvider.toggleState();
                                },
                            ),
                          ],
                        ),
                        style: CustomTextStyles.of(context).regular13,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildSocialMediaButton({
    required BuildContext context,
    required String imagePath,
    VoidCallback? onPressed,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            CustomColors.of(context).buttonBackgroundGradientStart,
            CustomColors.of(context).buttonBackgroundGradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget loginPart(BuildContext context, String loginText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 440.0,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 25.0,
              child: Image.asset(
                'assets/icons/shape_login_form.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'login'.tr(),
                onPressed: () {
                  context.goNamed(TabContainer.pageName);
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 56.0),
                      child: Text(
                        'login'.tr(),
                        style: CustomTextStyles.of(context).regular24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: CustomColors.of(context).primary,
                      margin: const EdgeInsets.only(left: 56.0),
                      height: 4,
                      width: 68,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon:
                            Image.asset('assets/icons/icon_email_small.png'),
                        hintText: 'email'.tr(),
                        hintStyle: CustomTextStyles.of(context).regular15.apply(
                              color: CustomColors.of(context)
                                  .primaryText
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon:
                            Image.asset('assets/icons/icon_eye_crossed.png'),
                        hintText: 'password'.tr(),
                        hintStyle: CustomTextStyles.of(context).regular15.apply(
                              color: CustomColors.of(context)
                                  .primaryText
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 56.0),
                      child: Text(
                        'forgot_password'.tr(),
                        style: CustomTextStyles.of(context).regular13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpPart(BuildContext context, String loginText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 440.0,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 25.0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Image.asset(
                  'assets/icons/shape_login_form.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'signup'.tr(),
                onPressed: () {
                  print('hello');
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 56.0),
                      child: Text(
                        'signup'.tr(),
                        style: CustomTextStyles.of(context).regular24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: CustomColors.of(context).primary,
                      margin: const EdgeInsets.only(right: 56.0),
                      height: 4,
                      width: 96,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon:
                            Image.asset('assets/icons/icon_profile_small.png'),
                        hintText: 'full_name'.tr(),
                        hintStyle: CustomTextStyles.of(context).regular15.apply(
                              color: CustomColors.of(context)
                                  .primaryText
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon:
                            Image.asset('assets/icons/icon_email_small.png'),
                        hintText: 'email'.tr(),
                        hintStyle: CustomTextStyles.of(context).regular15.apply(
                              color: CustomColors.of(context)
                                  .primaryText
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon:
                            Image.asset('assets/icons/icon_eye_crossed.png'),
                        hintText: 'password'.tr(),
                        hintStyle: CustomTextStyles.of(context).regular15.apply(
                              color: CustomColors.of(context)
                                  .primaryText
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
