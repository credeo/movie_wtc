import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/providers/movie_player_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MoviePlayer extends StatelessWidget {
  static const pageName = 'movie_player';

  final String movieId;

  const MoviePlayer({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviePlayerProvider(movieId),
      child: Consumer<MoviePlayerProvider>(
        builder: (context, moviePlayerProvider, child) {
          return Scaffold(
              backgroundColor: CustomColors.of(context).tertiaryBackground,
              appBar: const CustomAppBar(
                hasBackButton: true,
              ),
              body: SafeArea(
                  child: FlickVideoPlayer(
                      flickManager: moviePlayerProvider.flickManager)));
        },
      ),
    );
  }
}
