import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/services/user_service.dart';

class ProfileProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  String get name => _userService.name;

  void nameProfile() {
    print(_userService.name);
    _userService.name = controller.text;

    notifyListeners();
  }
}
