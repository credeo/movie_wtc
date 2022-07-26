import 'package:flutter/material.dart';

class CustomTextStyles {
  final BuildContext _context;
  const CustomTextStyles.of(BuildContext context) : _context = context;

  TextStyle get regular10 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular10!;
  TextStyle get regular12 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular12!;
  TextStyle get regular13 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular13!;
  TextStyle get regular15 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular15!;
  TextStyle get regular16 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular16!;
  TextStyle get regular17 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular17!;
  TextStyle get regular24 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.regular24!;
  TextStyle get medium12 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.medium12!;
  TextStyle get medium14 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.medium14!;
  TextStyle get semiBold14 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold14!;
  TextStyle get semiBold16 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold16!;
  TextStyle get semiBold18 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold18!;
  TextStyle get semiBold24 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold24!;
  TextStyle get semiBold28 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold28!;
  TextStyle get semiBold40 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold40!;
  TextStyle get extraBold15 =>
      Theme.of(_context).extension<CustomTextStyleScheme>()!.extraBold15!;
}

@immutable
class CustomTextStyleScheme extends ThemeExtension<CustomTextStyleScheme> {
  final TextStyle? regular10;
  final TextStyle? regular12;
  final TextStyle? regular13;
  final TextStyle? regular15;
  final TextStyle? regular16;
  final TextStyle? regular17;
  final TextStyle? regular24;
  final TextStyle? medium12;
  final TextStyle? medium14;
  final TextStyle? semiBold14;
  final TextStyle? semiBold16;
  final TextStyle? semiBold18;
  final TextStyle? semiBold24;
  final TextStyle? semiBold28;
  final TextStyle? semiBold40;
  final TextStyle? extraBold15;

  const CustomTextStyleScheme({
    required this.regular10,
    required this.regular12,
    required this.regular13,
    required this.regular15,
    required this.regular16,
    required this.regular17,
    required this.regular24,
    required this.medium12,
    required this.medium14,
    required this.semiBold14,
    required this.semiBold16,
    required this.semiBold18,
    required this.semiBold24,
    required this.semiBold28,
    required this.semiBold40,
    required this.extraBold15,
  });

  CustomTextStyleScheme.fromPrimaryTextColor(Color primaryTextColor)
      : regular10 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 10,
        ),
        regular12 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 12,
        ),
        regular13 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 13,
        ),
        regular15 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 15,
        ),
        regular16 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 16,
        ),
        regular17 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 17,
        ),
        regular24 = TextStyle(
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          fontSize: 24,
        ),
        medium12 = TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryTextColor,
          fontSize: 12,
        ),
        medium14 = TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryTextColor,
          fontSize: 14,
        ),
        semiBold14 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 14,
        ),
        semiBold16 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 16,
        ),
        semiBold18 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 18,
        ),
        semiBold24 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 24,
        ),
        semiBold28 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 28,
        ),
        semiBold40 = TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
          fontSize: 40,
        ),
        extraBold15 = TextStyle(
          fontWeight: FontWeight.w800,
          color: primaryTextColor,
          fontSize: 15,
        );

  @override
  CustomTextStyleScheme copyWith({
    TextStyle? regular10,
    TextStyle? regular12,
    TextStyle? regular13,
    TextStyle? regular15,
    TextStyle? regular16,
    TextStyle? regular17,
    TextStyle? regular24,
    TextStyle? medium12,
    TextStyle? medium14,
    TextStyle? semiBold14,
    TextStyle? semiBold16,
    TextStyle? semiBold18,
    TextStyle? semiBold24,
    TextStyle? semiBold28,
    TextStyle? semiBold40,
    TextStyle? extraBold15,
  }) {
    return CustomTextStyleScheme(
      regular10: regular10 ?? this.regular10,
      regular12: regular12 ?? this.regular12,
      regular13: regular13 ?? this.regular13,
      regular15: regular15 ?? this.regular15,
      regular16: regular16 ?? this.regular16,
      regular17: regular17 ?? this.regular17,
      regular24: regular24 ?? this.regular24,
      medium12: medium12 ?? this.medium12,
      medium14: medium14 ?? this.medium14,
      semiBold14: semiBold14 ?? this.semiBold14,
      semiBold16: semiBold16 ?? this.semiBold16,
      semiBold18: semiBold18 ?? this.semiBold18,
      semiBold24: semiBold24 ?? this.semiBold24,
      semiBold28: semiBold28 ?? this.semiBold28,
      semiBold40: semiBold40 ?? this.semiBold40,
      extraBold15: extraBold15 ?? this.extraBold15,
    );
  }

  @override
  CustomTextStyleScheme lerp(
      ThemeExtension<CustomTextStyleScheme>? other, double t) {
    if (other is! CustomTextStyleScheme) {
      return this;
    }
    return CustomTextStyleScheme(
      regular10: TextStyle.lerp(regular10, other.regular10, t),
      regular12: TextStyle.lerp(regular12, other.regular12, t),
      regular13: TextStyle.lerp(regular13, other.regular13, t),
      regular15: TextStyle.lerp(regular15, other.regular15, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      regular17: TextStyle.lerp(regular17, other.regular17, t),
      regular24: TextStyle.lerp(regular24, other.regular24, t),
      medium12: TextStyle.lerp(medium12, other.medium12, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      semiBold14: TextStyle.lerp(semiBold14, other.semiBold14, t),
      semiBold16: TextStyle.lerp(semiBold16, other.semiBold16, t),
      semiBold18: TextStyle.lerp(semiBold18, other.semiBold18, t),
      semiBold24: TextStyle.lerp(semiBold24, other.semiBold24, t),
      semiBold28: TextStyle.lerp(semiBold28, other.semiBold28, t),
      semiBold40: TextStyle.lerp(semiBold40, other.semiBold40, t),
      extraBold15: TextStyle.lerp(extraBold15, other.extraBold15, t),
    );
  }
}
