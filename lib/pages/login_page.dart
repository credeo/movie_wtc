import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lineWidth = MediaQuery.of(context).size.width / 375.0 * 100.0;
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      body: ListView(
        children: [
          Image.asset('assets/icons/icon_app_big.png'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 440.0,
              child: ColoredBox(
                color: Colors.red,
                child: Stack(
                  children: [],
                ),
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
            child: Text(
              'Don’t have an account? Sign Up',
              style: CustomTextStyles.of(context).regular13,
            ),
          ),
        ],
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
