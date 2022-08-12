import 'package:easy_localization/easy_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  AppProvider() {
    _init();
  }

  void _init() async {
    EasyLocalization.logger.enableLevels = [
      LevelMessages.info,
      LevelMessages.warning,
      LevelMessages.error
    ];
    await EasyLocalization.ensureInitialized();
  }

  void splashFinished() async {
    _isLoaded = true;
    notifyListeners();
  }
}
