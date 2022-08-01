import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onAnimationEnd;

  const SplashPage({super.key, required this.onAnimationEnd});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
    });
    const colorScheme = CustomColorScheme.light();
    return Container(
      color: colorScheme.background,
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: _opacity,
        curve: Curves.easeIn,
        onEnd: () async {
          await Future.delayed(const Duration(seconds: 2));
          widget.onAnimationEnd();
        },
        child: Image.asset('assets/icons/icon_splash.png'),
      ),
    );
  }
}
