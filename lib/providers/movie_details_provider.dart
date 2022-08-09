import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:movie_wtc/services/user_service.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get myMovieList => _userService.myMoviesList;

  late final Movie movie;

  MovieDetailsProvider(String movieId) {
    movie = _movieService.getMovieWithId(movieId)!;
  }

  void addMovieInMyList(Movie movie) {
    // _userService.addMovieInList(movie);
    notifyListeners();
  }

  void removeMovieFromMyList(Movie movie) {
    // _userService.removeMovieFromMyList(movie);
    notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    return false;
  }
}
