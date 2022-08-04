import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';

class DownloadsService extends ChangeNotifier {
  final List<Movie> _downloadedMovies = [];

  List<Movie> get downloadedMovies => List.unmodifiable(_downloadedMovies);

  DownloadsService() {
    _init();
  }

  void _init() {
    _downloadedMovies.add(Movie(
      title: 'Bridgerton',
      coverImage: 'assets/images/movies/bridgerton.png',
      genres: [Genre.romance, Genre.mystery],
      subtitle:
          'Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family',
      details: 'TV Show',
      releaseDate: DateTime.now().add(
        const Duration(days: 30),
      ),
      forAdults: true,
    ));
    _downloadedMovies.add(Movie(
      title: 'Thor: Love and Thunder',
      coverImage: 'assets/images/movies/thor.jpg',
      genres: [Genre.comedy],
      subtitle:
          'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct',
      details: 'Movie',
      releaseDate: DateTime.now().add(
        const Duration(days: 40),
      ),
      forAdults: false,
    ));
  }

  void startDownload(Movie movie) {}
}
