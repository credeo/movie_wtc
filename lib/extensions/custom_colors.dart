import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get secondary => Theme.of(_context).extension<CustomColorScheme>()!.secondary!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get background => Theme.of(_context).extension<CustomColorScheme>()!.background!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? secondary;
  final Color? primaryText;
  final Color? background;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.primaryText,
    required this.background,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff0A84FF),
    this.secondary = const Color(0xffffffff),
    this.primaryText = const Color(0xffffffff),
    this.background = const Color(0xff1C1C1E),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? secondary,
    Color? primaryText,
    Color? background,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      primaryText: primaryText ?? this.primaryText,
      background: background ?? this.background,
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
    );
  }
}
