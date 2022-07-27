import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.of(context).background,
    );
  }
}
