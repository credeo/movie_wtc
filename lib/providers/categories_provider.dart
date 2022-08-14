import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class CategoriesProvider extends ChangeNotifier {
  final _moviesService = KiwiContainer().resolve<MovieService>();

  List<Movie> get movie => _moviesService.suggestedMovies;

  List<Genre> gen = [];

  void addGen(int index) {
    gen.add(Genre.values[index]);
    notifyListeners();
  }

  bool a(Movie mov) {
    var b = movie.any((element) => element.genres == mov.genres);
    return b;
  }
}
