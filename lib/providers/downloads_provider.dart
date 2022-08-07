import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadProvider extends ChangeNotifier {
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();

  List<Movie> get downloadMovies => _downloadsService.downloadMovies;

  //DownloadProvider() {}
}
