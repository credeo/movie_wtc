import 'package:flutter/foundation.dart';

enum LoginState { login, signup }

class LoginPageProvider extends ChangeNotifier {
  var _state = LoginState.login;

  LoginState get state => _state;

  void toggleState() {
    if (_state == LoginState.login) {
      _state = LoginState.signup;
    } else {
      _state = LoginState.login;
    }
    notifyListeners();
  }
}
