import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

Widget loginSignUpSceleton(BuildContext context) {
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
          const LoginSignUpForm(),
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
            child: textRichSignLog(
              context: context,
              text1: 'Don’t have an account? ',
              text2: 'Sign Up',
            ),
          ),
        ],
      ),
    ),
  );
}

Widget textRichSignLog({
  required BuildContext context,
  required String text1,
  required String text2,
}) {
  return Text.rich(
    TextSpan(
      text: text1,
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () => context.go('sign_up'),
          text: text2,
          style: CustomTextStyles.of(context)
              .regular13
              .apply(color: CustomColors.of(context).primary),
        ),
      ],
    ),
    style: CustomTextStyles.of(context).regular13,
  );
}

class LoginSignUpForm extends StatelessWidget {
  const LoginSignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                title: 'Login', //////////////////////////
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
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 56.0),
                      child: Text(
                        'Login', ////////////////////////////////////////
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
                  const SizedBox(height: 58),
                  textFieldForLoginSignUp(
                    context: context,
                    imagePath: 'assets/icons/icon_email_small.png',
                    hintText: 'Email Address',
                  ),
                  const SizedBox(height: 32),
                  textFieldForLoginSignUp(
                    context: context,
                    imagePath: 'assets/icons/icon_eye_crossed.png',
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 56.0),
                      child: Text(
                        'Forgot Password?', ////////////////////////////
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