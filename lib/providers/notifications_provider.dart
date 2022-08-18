import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class NotificationsProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get notificationList => _userService.myNotificationsList;
  int get counter => _userService.myNotificationsList.length;

  void addMovieNotification(Movie movie) {
    _userService.addNotification(movie);
    notifyListeners();
  }

  void removeMovieNotification(Movie movie) {
    _userService.removeNotification(movie);
    notifyListeners();
  }

  bool isMovieInNotifications(Movie movie) {
    return _userService.isMovieInNotifications(movie);
  }

  void clearList() {
    _userService.clearNotifications();
    notifyListeners();
  }
}
