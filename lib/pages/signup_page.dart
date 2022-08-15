import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/widgets/build_social_media_button.dart';
import 'dart:math' as math;

import 'package:movie_wtc/widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lineWidth = MediaQuery.of(context).size.width / 375.0 * 100.0;
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 48),
          children: [
            SizedBox(
              height: 72,
              child: Image.asset(
                'assets/icons/icon_app_big.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 1.9, right: 4.5),
              child: SizedBox(
                height: 457.0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: 28,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(
                          'assets/icons/shape_login_form.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      heightFactor: 8.96,
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        title: 'signup'.tr(),
                        onPressed: () {},
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          const SizedBox(height: 58),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: const EdgeInsets.only(right: 56.0),
                              child: Text(
                                'signup'.tr(),
                                style: CustomTextStyles.of(context).regular24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              color: CustomColors.of(context).primary,
                              margin: const EdgeInsets.only(right: 56.0),
                              height: 4,
                              width: 99,
                            ),
                          ),
                          const SizedBox(height: 48),
                          textFieldForLoginSignUp(
                            context: context,
                            imagePath: 'assets/icons/icon_profile_small.png',
                            hintText: 'full_name'.tr(),
                          ),
                          const SizedBox(height: 15),
                          textFieldForLoginSignUp(
                            context: context,
                            imagePath: 'assets/icons/icon_email_small.png',
                            hintText: 'email'.tr(),
                          ),
                          const SizedBox(height: 15),
                          textFieldForLoginSignUp(
                            context: context,
                            imagePath: 'assets/icons/icon_eye_crossed.png',
                            hintText: 'password'.tr(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
              child: Text.rich(
                TextSpan(
                  text: 'Don’t have an account? ',
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: CustomColors.of(context).primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go('/');
                        },
                    ),
                  ],
                ),
                style: CustomTextStyles.of(context).regular13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               tileMode: TileMode.clamp,
//                               colors: [
//                                 CustomColors.of(context)
//                                     .buttonBackgroundGradientStart,
//                                 CustomColors.of(context)
//                                     .buttonBackgroundGradientEnd,
//                               ],
//                               begin: Alignment.bottomCenter,
//                               end: Alignment.topCenter,
//                             ),
//                             color: Colors.red,
//                             borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(110),
//                               bottomRight: Radius.circular(110),
//                               topLeft: Radius.elliptical(600, 490),
//                               topRight: Radius.circular(110),
//                             ),
//                           ),
//                         ),
