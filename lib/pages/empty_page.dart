import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'novi tekst',
          style: CustomTextStyle.of(context).regular24,
        ),
      ),
    );
  }
}
