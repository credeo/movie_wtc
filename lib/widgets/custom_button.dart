import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 152,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: CustomColors.of(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: CustomTextStyles.of(context).semiBold16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Widget textFieldForLoginSignUp({
  required BuildContext context,
  required String imagePath,
  required String hintText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 56.0),
    child: TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Image.asset(imagePath),
        hintText: hintText,
        hintStyle: CustomTextStyles.of(context).regular15.apply(
              color: CustomColors.of(context).primaryText.withOpacity(0.7),
            ),
      ),
    ),
  );
}
