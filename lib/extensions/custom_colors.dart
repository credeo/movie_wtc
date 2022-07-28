import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary =>
      Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get secondary =>
      Theme.of(_context).extension<CustomColorScheme>()!.secondary!;
  Color get primaryText =>
      Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get background =>
      Theme.of(_context).extension<CustomColorScheme>()!.background!;
  Color get buttonBackgroundGradientStart => Theme.of(_context)
      .extension<CustomColorScheme>()!
      .buttonBackgroundGradientStart!;
  Color get buttonBackgroundGradientEnd => Theme.of(_context)
      .extension<CustomColorScheme>()!
      .buttonBackgroundGradientEnd!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? secondary;
  final Color? primaryText;
  final Color? background;
  final Color? buttonBackgroundGradientStart;
  final Color? buttonBackgroundGradientEnd;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.primaryText,
    required this.background,
    required this.buttonBackgroundGradientStart,
    required this.buttonBackgroundGradientEnd,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff0A84FF),
    this.secondary = const Color(0xffffffff),
    this.primaryText = const Color(0xffffffff),
    this.background = const Color(0xff1C1C1E),
    this.buttonBackgroundGradientStart = const Color(0xff2F2F2F),
    this.buttonBackgroundGradientEnd = const Color(0xff161616),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? secondary,
    Color? primaryText,
    Color? background,
    Color? buttonBackgroundGradientStart,
    Color? buttonBackgroundGradientEnd,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      primaryText: primaryText ?? this.primaryText,
      background: background ?? this.background,
      buttonBackgroundGradientStart:
          buttonBackgroundGradientStart ?? this.buttonBackgroundGradientStart,
      buttonBackgroundGradientEnd:
          buttonBackgroundGradientEnd ?? this.buttonBackgroundGradientEnd,
    );
  }

  @override
  CustomColorScheme lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      background: Color.lerp(background, other.background, t),
      buttonBackgroundGradientStart:
          Color.lerp(background, other.buttonBackgroundGradientStart, t),
      buttonBackgroundGradientEnd:
          Color.lerp(background, other.buttonBackgroundGradientEnd, t),
    );
  }
}
