import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/widgets/custom_button.dart';

import '../services/router_service.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                )),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 440.0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: 40.0,
                      child: Image.asset(
                        'assets/icons/shape_signup_form.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        title: 'Sign up',
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
                                'Sign up',
                                style: CustomTextStyles.of(context).regular24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              color: CustomColors.of(context).primary,
                              margin: const EdgeInsets.only(right: 56.0),
                              height: 4,
                              width: 68,
                            ),
                          ),
                          const SizedBox(height: 38),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 56.0),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset('assets/icons/icon_profile_small.png'),
                                hintText: 'Full Name',
                                hintStyle: CustomTextStyles.of(context).regular15.apply(
                                  color: CustomColors.of(context).primaryText.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 56.0),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset('assets/icons/icon_email_small.png'),
                                hintText: 'Email Address',
                                hintStyle: CustomTextStyles.of(context).regular15.apply(
                                  color: CustomColors.of(context).primaryText.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 56.0),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset('assets/icons/icon_eye_crossed.png'),
                                hintText: 'Password',
                                hintStyle: CustomTextStyles.of(context).regular15.apply(
                                  color: CustomColors.of(context).primaryText.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),

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
                        'OR',
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
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: CustomTextStyles.of(context).regular13.apply(color: CustomColors.of(context).primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap=(){
                          KiwiContainer().resolve<RouterService>().router.go("/");

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
}
