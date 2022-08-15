import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/services/user_service.dart';

class ProfileProvider extends ChangeNotifier {
  UserService _myService = KiwiContainer().resolve<UserService>();
  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  String get name => _myService.name;

  void setName() {
    _myService.setName(_controller.text);
    notifyListeners();
  }
}
