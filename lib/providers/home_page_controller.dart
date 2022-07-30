import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePageProvider extends ChangeNotifier {
  PageController _controller=PageController();
  int _index=0;

  void set index(int i){
    _index=i;
  }

  PageController get controller => _controller;

  HomePageProvider(){
    Timer.periodic(const Duration(seconds: 7), (timer) {
      _controller.animateToPage((_index+1)%3,duration: const Duration(seconds: 1),curve:ElasticOutCurve());
      notifyListeners();
    });
  }
  
}
