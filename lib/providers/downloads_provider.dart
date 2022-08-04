import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class DownloadProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();

  List<Movie> get downloadMovies => _movieService.downloadMovies;

  DownloadProvider() {
    _getDownloadMovies();
  }

  Future<void> _getDownloadMovies() async {
    await _movieService.fetchDownloadsMovies();

    notifyListeners();
  }
}
