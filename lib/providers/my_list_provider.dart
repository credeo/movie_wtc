import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class MyListProvider extends ChangeNotifier {
  final List<Movie> _myMovies =
      KiwiContainer().resolve<UserService>().myMoviesList;

  List<Movie> get myMovies => List.unmodifiable(_myMovies);
}
