import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String title;
  final String iconPath;
  final double? width;
  final VoidCallback? onPressed;

  const CustomButtonWithIcon({
    super.key,
    required this.title,
    required this.iconPath,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width ?? 152,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: CustomColors.of(context).secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: CustomTextStyles.of(context).semiBold16.apply(color: CustomColors.of(context).secondaryText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
