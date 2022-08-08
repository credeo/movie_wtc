import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class DetailProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get myMovieList => _userService.myMoviesList;

  void addMovieInMyList(Movie movie) {
    _userService.addMovieInList(movie);
    notifyListeners();
  }

  void removeMovieFromMyList(Movie movie) {
    _userService.removeMovieFromMyList(movie);
    notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    notifyListeners();
    return _userService.isMovieHere(movie);
  }
}
