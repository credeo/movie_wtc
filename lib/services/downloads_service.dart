import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';

class DownloadsService extends ChangeNotifier {
  List<Movie> _downloadMovies = [];

  List<Movie> get downloadMovies => List.unmodifiable(_downloadMovies);

  DownloadsService() {
    initDownload();
  }

  void initDownload() {
    _downloadMovies.add(
      Movie(
        title: 'Stranger Things',
        coverImage: 'assets/images/movies/stranger_things.jpg',
        genres: [Genre.comedy],
        subtitle:
            'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back\n...',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 50),
        ),
        duration: 160,
        downloadSize: 500,
        //ageRating: AgeRating.restricted,
      ),
    );
    _downloadMovies.add(
      Movie(
        title: 'The Witcher',
        coverImage: 'assets/images/movies/the_witcher.jpg',
        genres: [Genre.comedy],
        subtitle:
            'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts\n...',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 60),
        ),
        duration: 160,
        downloadSize: 500,
        ageRating: AgeRating.restricted,
      ),
    );
  }

  void startDownloads(Movie movie) {}
}
