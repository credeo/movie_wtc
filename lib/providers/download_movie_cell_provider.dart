import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/download_movie.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadMovieCellProvider extends ChangeNotifier {
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();
  final Movie movie;
  DownloadMovie? _downloadMovie;

  late DownloadMovieState _state;

  DownloadMovie? get downloadMovie => _downloadMovie;

  DownloadMovieState get state => _state;

  DownloadMovieCellProvider(this.movie) {
    _downloadMovie = _downloadsService.getDownloadMovie(movie);
    _state = _downloadMovie == null
        ? DownloadMovieState.pending
        : _downloadMovie!.state;
    _downloadsService.addListener(downloadsServiceListener);
  }

  @override
  void dispose() {
    _downloadsService.removeListener(downloadsServiceListener);
    super.dispose();
  }

  void startDownload() {
    _downloadsService.startDownload(movie);
  }

  void downloadsServiceListener() {
    _downloadMovie = _downloadsService.getDownloadMovie(movie);
    notifyListeners();
  }
}
