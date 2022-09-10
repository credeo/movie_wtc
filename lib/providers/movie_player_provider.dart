import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerProvider extends ChangeNotifier {
  final _movieService = KiwiContainer().resolve<MovieService>();
  late final Movie movie;
  late final FlickManager flickManager;

  MoviePlayerProvider(String movieId) {
    movie = _movieService.getMovieWithId(movieId)!;

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    flickManager.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
