import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class DownloadProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();
  bool _isPressed = false;
  //CountDownController get controller => CountDownController();
  List<Movie> get downloadMovies => _movieService.downloadMovies;
  bool get isPressed => _isPressed;
  DownloadProvider() {
    _getDownloadMovies();
    //startT();
  }

  Future<void> _getDownloadMovies() async {
    await _movieService.fetchDownloadsMovies();

    notifyListeners();
  }

  void onPressed() {
    if (_isPressed) {
      _isPressed = false;
    } else {
      _isPressed = true;
    }
    notifyListeners();
  }

  // bool? onClick(VoidCallback onPressed) {
  //   if (_controller.isStarted) {
  //   } else {
  //     _controller.start();
  //     notifyListeners();
  //   }
  // }
}
