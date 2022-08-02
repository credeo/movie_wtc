import 'package:movie_wtc/models/movie.dart';

class MovieService {
  List<Movie> _suggestedMovies = [];
  List<Movie> _comingSoonMovies = [];

  List<Movie> get suggestedMovies => List.unmodifiable(_suggestedMovies);
  List<Movie> get comingSoonMovies => List.unmodifiable(_comingSoonMovies);

  Future<void> fetchSuggestedMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _suggestedMovies = [
      Movie(
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
      ),
      Movie(
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
      ),
      Movie(
        title: 'Stranger Things',
        coverImage: 'assets/images/movies/stranger_things.jpg',
        genres: [Genre.comedy],
        subtitle:
            'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 50),
        ),
        forAdults: false,
      ),
      Movie(
        title: 'The Witcher',
        coverImage: 'assets/images/movies/the_witcher.jpg',
        genres: [Genre.comedy],
        subtitle:
            'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 60),
        ),
        forAdults: true,
      ),
    ];
  }

  Future<void> fetchComingSoonMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _comingSoonMovies = [
      Movie(
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
      ),
      Movie(
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
      ),
      Movie(
        title: 'Stranger Things',
        coverImage: 'assets/images/movies/stranger_things.jpg',
        genres: [Genre.comedy],
        subtitle:
            'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 50),
        ),
        forAdults: false,
      ),
      Movie(
        title: 'The Witcher',
        coverImage: 'assets/images/movies/the_witcher.jpg',
        genres: [Genre.comedy],
        subtitle:
            'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 60),
        ),
        forAdults: true,
      ),
    ];
  }
}
