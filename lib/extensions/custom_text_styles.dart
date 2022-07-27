import 'package:flutter/material.dart';

class CustomTextStyles {
  final BuildContext _context;
  const CustomTextStyles.of(BuildContext context) : _context = context;

  TextStyle get regular13 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular13!;
  TextStyle get regular15 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular15!;
  TextStyle get regular24 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular24!;
}

@immutable
class CustomTextStyleScheme extends ThemeExtension<CustomTextStyleScheme> {
  final TextStyle? regular13;
  final TextStyle? regular15;
  final TextStyle? regular24;

  const CustomTextStyleScheme({
    required this.regular13,
    required this.regular15,
    required this.regular24,
  });

  CustomTextStyleScheme.fromPrimaryTextColor(Color primaryTextColor)
      : regular13 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 13,
        ),
        regular15 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 15,
        ),
        regular24 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 24,
        );

  @override
  CustomTextStyleScheme copyWith({
    TextStyle? regular13,
    TextStyle? regular15,
    TextStyle? regular24,
  }) {
    return CustomTextStyleScheme(
      regular13: regular13 ?? this.regular13,
      regular15: regular15 ?? this.regular15,
      regular24: regular24 ?? this.regular24,
    );
  }

  @override
  CustomTextStyleScheme lerp(ThemeExtension<CustomTextStyleScheme>? other, double t) {
    if (other is! CustomTextStyleScheme) {
      return this;
    }
    return CustomTextStyleScheme(
      regular13: TextStyle.lerp(regular13, other.regular13, t),
      regular15: TextStyle.lerp(regular15, other.regular15, t),
      regular24: TextStyle.lerp(regular24, other.regular24, t),
    );
  }
}
