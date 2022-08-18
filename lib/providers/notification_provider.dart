import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class NotificationProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get myMovieList => _userService.myMoviesList;

  int get counter => _userService.myMoviesList.length;

  void addMovieNotification(Movie movie) {
    _userService.addToMyList(movie);
    print(myMovieList.length);

    notifyListeners();
  }

  void removeMovieNotification(Movie movie) {
    _userService.removeFromMyList(movie);
    print(myMovieList.length);
    notifyListeners();
  }

  bool isMovieInNotifications(Movie movie) {
    return _userService.isMovieInMyList(movie);
  }

  void clearList() {
    _userService.clearList();
    notifyListeners();
  }
}
