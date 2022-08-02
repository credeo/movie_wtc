import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

enum HomeState { loading, ready }

class HomeProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final _movieService = KiwiContainer().resolve<MovieService>();

  HomeState _state = HomeState.loading;

  HomeState get state => _state;
  List<Movie> get suggestedMovies => _movieService.suggestedMovies;

  HomeProvider() {
    scrollController.addListener(scrollControllerListener);
    _init();
  }
  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _init() async {
    await _movieService.fetchSuggestedMovies();
    _state = HomeState.ready;
    notifyListeners();
  }

  void scrollControllerListener() {
    notifyListeners();
  }
}
