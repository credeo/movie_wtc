import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:movie_wtc/services/user_service.dart';

enum HomeState { loading, ready }

class ComingSoonProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();
  final _movieService = KiwiContainer().resolve<MovieService>();
  HomeState _state = HomeState.loading;
  bool _isDisposed = false;

  HomeState get state => _state;
  List<Movie> get comingSoonMovies => _movieService.comingSoonMovies;
  List<Movie> get notificationMovies => _userService.myNotificationsList;

  ComingSoonProvider() {
    _getComingSoonMovies();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> _getComingSoonMovies() async {
    await _movieService.fetchComingSoonMovies();
    _state = HomeState.ready;
    if (!_isDisposed) notifyListeners();
  }

  void addMovieToMyList(Movie movie) {
    _userService.addToMyList(movie);
    notifyListeners();
  }

  void removeMovieFromMyList(Movie movie) {
    _userService.removeFromMyList(movie);
    notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    return _userService.isMovieInMyList(movie);
  }

  void toggleNotificationForMovie(Movie movie) {
    if (isMovieInNotificationsList(movie)) {
      _userService.removeNotification(movie);
    } else {
      _userService.addNotification(movie);
    }
    notifyListeners();
  }

  bool isMovieInNotificationsList(Movie movie) {
    return _userService.isMovieInNotifications(movie);
  }
}
