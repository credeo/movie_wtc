import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

enum _CustomButtonType { primary, secondary }

class CustomButtonWithIcon extends StatelessWidget {
  final _CustomButtonType _type;
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
  }) : _type = _CustomButtonType.primary;

  const CustomButtonWithIcon.secondary({
    super.key,
    required this.title,
    required this.iconPath,
    this.width,
    this.onPressed,
  }) : _type = _CustomButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width ?? 152,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _type == _CustomButtonType.primary
              ? CustomColors.of(context).secondary
              : CustomColors.of(context).secondaryBackground,
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
                color: _type == _CustomButtonType.primary
                    ? null
                    : CustomColors.of(context).primaryText,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: CustomTextStyles.of(context).semiBold16.apply(
                  color: _type == _CustomButtonType.primary
                      ? CustomColors.of(context).secondaryText
                      : CustomColors.of(context).primaryText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
