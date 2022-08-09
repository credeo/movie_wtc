import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class SnackbarHelper {
  static SnackBar buildInfoSnackbar({required BuildContext context, required String text}) {
    return SnackBar(
      content: Text(
        text,
        style: CustomTextStyles.of(context).medium14,
      ),
      backgroundColor: CustomColors.of(context).secondaryBackground,
    );
  }
}
