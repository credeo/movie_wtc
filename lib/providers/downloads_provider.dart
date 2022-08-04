import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/downloads_service.dart';

class DownloadsProvider extends ChangeNotifier {
  final _downloadsService = KiwiContainer().resolve<DownloadsService>();

  List<Movie> get downloadedMovies => _downloadsService.downloadedMovies;

  // void startDownloading(int index) {
  //   Timer.periodic(const Duration(milliseconds: 200), (timer) {
  //     _value[index] += 0.01;
  //     if (value[index] >= 1) _state[index] = DownloadsState.downloaded;
  //     notifyListeners();
  //   });
  //   print("Started");
  // }
}
