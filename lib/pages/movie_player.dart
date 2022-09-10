import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/providers/movie_player_provider.dart';
import 'package:provider/provider.dart';

class MoviePlayer extends StatelessWidget {
  static const pageNameFromHome = 'movie_player_home';
  static const pageNameFromDetails = 'movie_player_details';

  final String movieId;

  const MoviePlayer({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviePlayerProvider(movieId),
      child: Consumer<MoviePlayerProvider>(
        builder: (context, moviePlayerProvider, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Image.asset('assets/icons/icon_arrow_back.png'),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              body: FlickVideoPlayer(
                flickVideoWithControls: FlickVideoWithControls(
                  videoFit: BoxFit.contain,
                  controls: SafeArea(
                    child: FlickPortraitControls(
                      progressBarSettings: FlickProgressBarSettings(
                        bufferedColor: Colors.lightBlueAccent,
                        playedColor: Colors.blue,
                        height: 5,
                        handleColor: Colors.white24,
                        handleRadius: 5,
                      ),
                    ),
                  ),
                ),
                preferredDeviceOrientation: const [
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.landscapeLeft
                ],
                flickManager: moviePlayerProvider.flickManager,
              ),
            ),
          );
        },
      ),
    );
  }
}
