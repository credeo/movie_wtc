import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];

  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);

  void addMovieInList(Movie movie) {
    _myMoviesList.add(movie);
  }

  void removeMovieFromMyList(Movie movie) {
    _myMoviesList.remove(movie);
  }

  bool isMovieHere(Movie movie) {
    return _myMoviesList.contains(movie);
  }
}
