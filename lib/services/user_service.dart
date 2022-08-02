import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];

  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);
}
