import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadMovieCellProvider extends ChangeNotifier {
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();
  final Movie movie;

  DownloadMovieCellProvider(this.movie);

  void startDownload() {
    _downloadsService.startDownload(movie);
  }
}
