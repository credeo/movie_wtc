import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    _init();
  }

  void _init() async {
    EasyLocalization.logger.enableLevels = [LevelMessages.info, LevelMessages.warning, LevelMessages.error];
    // await EasyLocalization.ensureInitialized();
  }
}
