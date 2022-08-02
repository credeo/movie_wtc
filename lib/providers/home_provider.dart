import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

enum HomeState { loading, ready }

class HomeProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  final _movieService = KiwiContainer().resolve<MovieService>();

  HomeState _state = HomeState.loading;

  HomeState get state => _state;
  List<Movie> get suggestedMovies => _movieService.suggestedMovies;

  HomeProvider() {
    _init();
  }

  void _init() async {
    await _movieService.fetchSuggestedMovies();
    _state = HomeState.ready;
    notifyListeners();
  }
}
