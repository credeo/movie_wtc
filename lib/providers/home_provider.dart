import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:movie_wtc/services/user_service.dart';

enum HomeState { loading, ready }

class HomeProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final _movieService = KiwiContainer().resolve<MovieService>();
  final _userService = KiwiContainer().resolve<UserService>();

  HomeState _state = HomeState.loading;

  HomeState get state => _state;
  List<Movie> get suggestedMovies => _movieService.suggestedMovies;
  List<Movie> get myMovieList => _userService.myMoviesList;

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
