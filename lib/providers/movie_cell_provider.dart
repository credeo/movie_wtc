import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadMovieCellProvider extends ChangeNotifier {
  final _downloadService = KiwiContainer().resolve<DownloadsService>();

  final Movie movie;

  DownloadMovieCellProvider(this.movie);

  //DownloadMovieCellProvider(this.movie);

  void startDownload() {
    _downloadService.startDownloads(movie);
  }
}
