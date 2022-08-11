import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  final _movieService = KiwiContainer().resolve<MovieService>();
  Iterable<Movie> _searchMovie = [];

  List<Movie> get suggestedMovies =>
      List.unmodifiable(_movieService.suggestedMovies);
  List<Movie> get searchMovie => List.unmodifiable(_searchMovie);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void search() {
    _searchMovie = suggestedMovies.where(
      (element) => element.title.toLowerCase().contains(
            controller.text.toLowerCase(),
          ),
    );

    print(controller.text);
    notifyListeners();
  }
}
