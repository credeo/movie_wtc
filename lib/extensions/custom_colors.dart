import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get secondary => Theme.of(_context).extension<CustomColorScheme>()!.secondary!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get secondaryText => Theme.of(_context).extension<CustomColorScheme>()!.secondaryText!;
  Color get background => Theme.of(_context).extension<CustomColorScheme>()!.background!;
  Color get secondaryBackground => Theme.of(_context).extension<CustomColorScheme>()!.secondaryBackground!;
  Color get tertiaryBackground => Theme.of(_context).extension<CustomColorScheme>()!.tertiaryBackground!;
  Color get inactive => Theme.of(_context).extension<CustomColorScheme>()!.inactive!;
  Color get buttonBackgroundGradientStart => Theme.of(_context).extension<CustomColorScheme>()!.buttonBackgroundGradientStart!;
  Color get buttonBackgroundGradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.buttonBackgroundGradientEnd!;
  Color get coverGradientStart => Theme.of(_context).extension<CustomColorScheme>()!.coverGradientStart!;
  Color get coverGradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.coverGradientEnd!;
  Color get tabbarGradientStart => Theme.of(_context).extension<CustomColorScheme>()!.tabbarGradientStart!;
  Color get tabbarGradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.tabbarGradientEnd!;
  Color get searchBackground => Theme.of(_context).extension<CustomColorScheme>()!.searchBackground!;
  Color get searchDivider => Theme.of(_context).extension<CustomColorScheme>()!.searchDivider!;
  Color get hintText => Theme.of(_context).extension<CustomColorScheme>()!.hintText!;
  Color get textCursor => Theme.of(_context).extension<CustomColorScheme>()!.textCursor!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? secondary;
  final Color? primaryText;
  final Color? secondaryText;
  final Color? background;
  final Color? secondaryBackground;
  final Color? tertiaryBackground;
  final Color? inactive;
  final Color? buttonBackgroundGradientStart;
  final Color? buttonBackgroundGradientEnd;
  final Color? coverGradientStart;
  final Color? coverGradientEnd;
  final Color? tabbarGradientStart;
  final Color? tabbarGradientEnd;
  final Color? searchBackground;
  final Color? searchDivider;
  final Color? hintText;
  final Color? textCursor;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.primaryText,
    required this.secondaryText,
    required this.background,
    required this.secondaryBackground,
    required this.tertiaryBackground,
    required this.inactive,
    required this.buttonBackgroundGradientStart,
    required this.buttonBackgroundGradientEnd,
    required this.coverGradientStart,
    required this.coverGradientEnd,
    required this.tabbarGradientEnd,
    required this.tabbarGradientStart,
    required this.searchBackground,
    required this.searchDivider,
    required this.hintText,
    required this.textCursor,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff0A84FF),
    this.secondary = const Color(0xffffffff),
    this.primaryText = const Color(0xffffffff),
    this.secondaryText = const Color(0xff141414),
    this.background = const Color(0xff1C1C1E),
    this.secondaryBackground = const Color(0xff262626),
    this.tertiaryBackground = const Color(0xff141414),
    this.inactive = const Color(0xffAAAAAA),
    this.buttonBackgroundGradientStart = const Color(0xff2F2F2F),
    this.buttonBackgroundGradientEnd = const Color(0xff161616),
    this.coverGradientStart = const Color(0xff141414),
    this.coverGradientEnd = const Color(0x00141414),
    this.tabbarGradientStart = const Color(0xF02F2F2F),
    this.searchBackground = const Color(0x3D767680),
    this.searchDivider = const Color(0xFF2C2C2C),
    this.tabbarGradientEnd = const Color(0xF0161616),
    this.hintText = const Color(0x99ebebf5),
    this.textCursor = const Color(0xffEAEAEB),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? secondary,
    Color? primaryText,
    Color? secondaryText,
    Color? background,
    Color? secondaryBackground,
    Color? tertiaryBackground,
    Color? inactive,
    Color? buttonBackgroundGradientStart,
    Color? buttonBackgroundGradientEnd,
    Color? coverGradientStart,
    Color? coverGradientEnd,
    Color? tabbarGradientEnd,
    Color? tabbarGradientStart,
    Color? searchBackground,
    Color? searchDivider,
    Color? hintText,
    Color? textCursor,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      background: background ?? this.background,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      tertiaryBackground: tertiaryBackground ?? this.tertiaryBackground,
      inactive: inactive ?? this.inactive,
      buttonBackgroundGradientStart: buttonBackgroundGradientStart ?? this.buttonBackgroundGradientStart,
      buttonBackgroundGradientEnd: buttonBackgroundGradientEnd ?? this.buttonBackgroundGradientEnd,
      coverGradientStart: coverGradientStart ?? this.coverGradientStart,
      coverGradientEnd: coverGradientEnd ?? this.coverGradientEnd,
      tabbarGradientEnd: tabbarGradientEnd ?? this.tabbarGradientEnd,
      tabbarGradientStart: tabbarGradientStart ?? this.tabbarGradientStart,
      searchBackground: searchBackground ?? this.searchBackground,
      searchDivider: searchDivider ?? this.searchDivider,
      hintText: hintText ?? this.hintText,
      textCursor: textCursor ?? this.textCursor,
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
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      background: Color.lerp(background, other.background, t),
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t),
      tertiaryBackground: Color.lerp(tertiaryBackground, other.tertiaryBackground, t),
      inactive: Color.lerp(inactive, other.inactive, t),
      buttonBackgroundGradientStart: Color.lerp(buttonBackgroundGradientStart, other.buttonBackgroundGradientStart, t),
      buttonBackgroundGradientEnd: Color.lerp(buttonBackgroundGradientEnd, other.buttonBackgroundGradientEnd, t),
      coverGradientStart: Color.lerp(coverGradientStart, other.coverGradientStart, t),
      coverGradientEnd: Color.lerp(coverGradientEnd, other.coverGradientEnd, t),
      tabbarGradientEnd: Color.lerp(tabbarGradientEnd, other.tabbarGradientEnd, t),
      searchBackground: Color.lerp(searchBackground, other.searchBackground, t),
      searchDivider: Color.lerp(searchDivider, other.searchDivider, t),
      hintText: Color.lerp(hintText, other.hintText, t),
      textCursor: Color.lerp(textCursor, other.textCursor, t),
      tabbarGradientStart: Color.lerp(tabbarGradientStart, other.tabbarGradientStart, t),
    );
  }
}
