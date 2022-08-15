import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/services/user_service.dart';

class ProfileProvider extends ChangeNotifier {
  final UserService _myService = KiwiContainer().resolve<UserService>();
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  String get name => _myService.name;

  void setName() {
    _myService.name = _controller.text;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
