import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class CategoriesProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();

  final Map<String, List<Movie>> _mapOfCategories = {};
  Map<String, List<Movie>> get mapOfCategories => _mapOfCategories;

  List<Movie> get _movies => _movieService.suggestedMovies;

  CategoriesProvider() {
    for (var movie in _movies) {
      for (var genre in movie.genres) {
        var key = genre.name;
        _mapOfCategories.putIfAbsent(key, () => []);
        _mapOfCategories[key]!.add(movie);
      }
    }
  }
  // CategoriesProvider() {
  //   for (int i = 0; i < _movies.length; i++) {
  //     for (int j = 0; j < _movies[i].genres.length; j++) {
  //       var key = _movies[i].genres[j].name;
  //       _mapOfCategories.putIfAbsent(key, () => []);
  //       _mapOfCategories[key]!.add(_movies[i]);
  //     }
  //   }
  // }
}
