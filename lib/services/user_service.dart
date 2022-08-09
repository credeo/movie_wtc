import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];

  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);

  void addToMyList(Movie movie) {
    _myMoviesList.add(movie);
    notifyListeners();
  }

  void removeFromMyList(Movie movie) {
    _myMoviesList.remove(movie);
    notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    return _myMoviesList.contains(movie);
  }
}
