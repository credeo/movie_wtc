import 'package:movie_wtc/models/movie.dart';

enum DownloadMovieState { pending, downloading, downloaded }

class DownloadMovie {
  final Movie movie;
  DownloadMovieState state;
  double downloadedSize;

  DownloadMovie({
    required this.movie,
    required this.state,
    required this.downloadedSize,
  });
}
