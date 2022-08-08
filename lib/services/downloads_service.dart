import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/download_movie.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:collection/collection.dart';

class DownloadsService extends ChangeNotifier {
  final List<DownloadMovie> _downloadedMovies = [];

  List<DownloadMovie> get downloadedMovies =>
      List.unmodifiable(_downloadedMovies);

  DownloadsService() {
    _init();
  }

  void _init() {
    _downloadedMovies.add(DownloadMovie(
      downloadedSize: 0.0,
      state: DownloadMovieState.pending,
      movie: Movie.test(0),
    ));
    _downloadedMovies.add(DownloadMovie(
      downloadedSize: 0.0,
      state: DownloadMovieState.pending,
      movie: Movie.test(1),
    ));
  }

  void startDownload(Movie movie) {
    final index =
        _downloadedMovies.indexWhere((element) => element.movie == movie);
    final DownloadMovie downloadMovieObj;
    if (index == -1) {
      downloadMovieObj = DownloadMovie(
        downloadedSize: 0.0,
        state: DownloadMovieState.pending,
        movie: movie,
      );
      _downloadedMovies.add(downloadMovieObj);
    } else {
      downloadMovieObj = downloadedMovies[index];
    }
    if (downloadMovieObj.state == DownloadMovieState.pending) {
      _downloadMovie(downloadMovieObj);
    }
  }

  DownloadMovie? getDownloadMovie(Movie movie) {
    return _downloadedMovies
        .firstWhereOrNull((element) => element.movie == movie);
  }

  void _downloadMovie(DownloadMovie downloadMovie) {
    print('started to download movie with title: ${downloadMovie.movie.title}');
    downloadMovie.state = DownloadMovieState.downloading;
    notifyListeners();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final interval = downloadMovie.movie.fileSize / 20.0;
      final downloaded = min(downloadMovie.movie.fileSize,
          downloadMovie.downloadedSize + interval);
      downloadMovie.downloadedSize = downloaded;
      if (downloadMovie.downloadedSize == downloadMovie.movie.fileSize) {
        downloadMovie.state = DownloadMovieState.downloaded;
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void deleteDownloadedMovies() {
    _downloadedMovies.clear();
  }
}
