import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

enum HomeState { loading, ready }

class ComingSoonProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();
  HomeState _state = HomeState.loading;

  HomeState get state => _state;
  List<Movie> get comingSoonMovies => _movieService.comingSoonMovies;

  ComingSoonProvider() {
    _getComingSoonMovies();
  }

  Future<void> _getComingSoonMovies() async {
    await _movieService.fetchComingSoonMovies();
    _state = HomeState.ready;
    notifyListeners();
  }
}
