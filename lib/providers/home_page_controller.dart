import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePageProvider extends ChangeNotifier {
  PageController _controller=PageController();
  int _index=0;
  Timer? _timer;

  void set index(int i){
    _index=i;
    _timer!.cancel();
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.animateToPage((_index+1)%3,duration: const Duration(seconds: 1),curve:ElasticOutCurve());
      notifyListeners();
    });
  }

  PageController get controller => _controller;

  HomePageProvider(){
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.animateToPage((_index+1)%3,duration: const Duration(seconds: 1),curve:ElasticOutCurve());
      notifyListeners();
    });
  }
  
}
