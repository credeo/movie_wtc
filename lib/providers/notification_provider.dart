import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class NotificationProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get myMovieList => _userService.myMoviesList;
  List<Movie> get notificationList => _userService.notificationList;

  int get counter => _userService.notificationList.length;

  void addMovieNotification(Movie movie) {
    _userService.addToNotification(movie);
    print(notificationList.length);
    notifyListeners();
  }

  void removeMovieNotification(Movie movie) {
    _userService.removeNotification(movie);
    print(notificationList.length);
    notifyListeners();
  }

  bool isMovieInNotifications(Movie movie) {
    return _userService.isMovieNotification(movie);
  }

  void clearList() {
    _userService.clearNotification();
    notifyListeners();
  }
}
