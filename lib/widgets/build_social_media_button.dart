import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';

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
