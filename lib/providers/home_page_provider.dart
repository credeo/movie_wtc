import 'package:flutter/foundation.dart';



class LoginPageProvider extends ChangeNotifier {

  int _currentPage=0;

  void toggleState() {

    notifyListeners();
  }
}
