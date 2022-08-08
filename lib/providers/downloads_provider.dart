import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/download_movie.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadsProvider extends ChangeNotifier {
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();

  List<DownloadMovie> get downloadedMovies =>
      _downloadsService.downloadedMovies;

  void addMovieForDownloading(Movie movie) {
    _downloadsService.addMovieForDownload(movie);
    notifyListeners();
  }

  void deleteDownloadedMovies() {
    _downloadsService.deleteDownloadedMovies();
    notifyListeners();
  }

  int isMovieAdd(Movie movie) {
    return _downloadsService.isMovieAdd(movie);
  }
}
