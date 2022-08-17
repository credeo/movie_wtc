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
              body: SafeArea(
                child: FlickVideoPlayer(
                  flickManager: moviePlayerProvider.flickManager,
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 30,
                          child: FlickPlayToggle(
                            togglePlay: () {
                              context.pop();
                            },
                            pauseChild:
                                Image.asset('assets/icons/icon_arrow_back.png'),
                            playChild:
                                Image.asset('assets/icons/icon_arrow_back.png'),
                            replayChild:
                                Image.asset('assets/icons/icon_arrow_back.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  preferredDeviceOrientation: const [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
