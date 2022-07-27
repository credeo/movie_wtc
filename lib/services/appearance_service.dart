import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

enum ThemeMode { light }

class AppearanceService extends ChangeNotifier {
  var _mode = ThemeMode.light;

  ThemeMode get themeMode => _mode;

  ThemeData buildTheme() {
    final ThemeData theme;
    switch (_mode) {
      case ThemeMode.light:
        const colorScheme = CustomColorScheme.light();
        final textStyleScheme = CustomTextStyleScheme.fromPrimaryTextColor(colorScheme.primaryText!);
        theme = ThemeData(
          brightness: Brightness.dark,
          extensions: <ThemeExtension<dynamic>>[colorScheme, textStyleScheme],
        );
        break;
    }
    return theme;
  }

  void changeTheme(ThemeMode mode) {
    if (_mode != mode) {
      _mode = mode;
      notifyListeners();
    }
  }
}
