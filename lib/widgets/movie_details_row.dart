import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class MovieDetailsRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Color? tintColor;
  final MainAxisAlignment? mainAxisAlignment;

  const MovieDetailsRow({
    super.key,
    required this.leftText,
    required this.rightText,
    this.mainAxisAlignment,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: CustomTextStyles.of(context).regular12.apply(color: tintColor ?? CustomColors.of(context).primaryText),
        ),
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(color: tintColor ?? CustomColors.of(context).primaryText, shape: BoxShape.circle),
        ),
        Text(
          rightText,
          style: CustomTextStyles.of(context).regular12.apply(color: tintColor ?? CustomColors.of(context).primaryText),
        ),
      ],
    );
  }
}
