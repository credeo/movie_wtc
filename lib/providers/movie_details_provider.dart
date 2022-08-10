import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/download_movie.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:movie_wtc/services/user_service.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();
  final _userService = KiwiContainer().resolve<UserService>();
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();

  List<Movie> get myMovieList => _userService.myMoviesList;

  late final Movie movie;

  MovieDetailsProvider(String movieId) {
    movie = _movieService.getMovieWithId(movieId)!;
  }

  void addMovieToMyList() {
    _userService.addToMyList(movie);
    notifyListeners();
  }

  void removeMovieFromMyList() {
    _userService.removeFromMyList(movie);
    notifyListeners();
  }

  bool isMovieInMyList() {
    return _userService.isMovieInMyList(movie);
  }

//////////
  DownloadMovieState? downloadMovie() {
    final downloadMovie = _downloadsService.getDownloadMovie(movie);
    if (downloadMovie == null) {
      _downloadsService.startDownload(movie);
      return null;
    } else {
      return downloadMovie.state;
    }
  }
}
