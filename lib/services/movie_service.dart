import 'package:movie_wtc/models/movie.dart';

class MovieService {
  List<Movie> _suggestedMovies = [];
  List<Movie> _comingSoonMovies = [];

  //downloadprovider,downloadscreen
  List<Movie> _downloadedMovies = [];

  List<Movie> get suggestedMovies => List.unmodifiable(_suggestedMovies);
  List<Movie> get comingSoonMovies => List.unmodifiable(_comingSoonMovies);
  List<Movie> get downloadedMovies => List.unmodifiable(_downloadedMovies);

  Future<void> fetchSuggestedMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _suggestedMovies = [
      Movie(
          title: 'Bridgerton',
          coverImage: 'assets/images/movies/bridgerton.png',
          genres: [Genre.romance, Genre.mystery],
          subtitle:
              'Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 30),
          ),
          ageRating: AgeRating.restricted),
      Movie(
          title: 'Thor: Love and Thunder',
          coverImage: 'assets/images/movies/thor.jpg',
          genres: [Genre.action],
          subtitle:
              'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct\n...',
          details: 'Movie',
          releaseDate: DateTime.now().add(
            const Duration(days: 40),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
          title: 'Stranger Things',
          coverImage: 'assets/images/movies/stranger_things.jpg',
          genres: [Genre.mystery],
          subtitle:
              'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 50),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
        title: 'The Witcher',
        coverImage: 'assets/images/movies/the_witcher.jpg',
        genres: [Genre.action],
        subtitle:
            'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts\n...',
        details: 'TV Show',
        releaseDate: DateTime.now().add(
          const Duration(days: 60),
        ),
        ageRating: AgeRating.restricted,
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
              'Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 30),
          ),
          ageRating: AgeRating.restricted),
      Movie(
          title: 'Thor: Love and Thunder',
          coverImage: 'assets/images/movies/thor.jpg',
          genres: [Genre.action],
          subtitle:
              'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct\n...',
          details: 'Movie',
          releaseDate: DateTime.now().add(
            const Duration(days: 40),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
          title: 'Stranger Things',
          coverImage: 'assets/images/movies/stranger_things.jpg',
          genres: [Genre.mystery],
          subtitle:
              'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 50),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
          title: 'The Witcher',
          coverImage: 'assets/images/movies/the_witcher.jpg',
          genres: [Genre.action],
          subtitle:
              'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 60),
          ),
          ageRating: AgeRating.restricted),
    ];
  }

  Future<void> fetchDownloadingMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _comingSoonMovies = [
      Movie(
          title: 'Bridgerton',
          coverImage: 'assets/images/movies/bridgerton.png',
          genres: [Genre.romance, Genre.mystery],
          subtitle:
              'Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 30),
          ),
          ageRating: AgeRating.restricted),
      Movie(
          title: 'Thor: Love and Thunder',
          coverImage: 'assets/images/movies/thor.jpg',
          genres: [Genre.action],
          subtitle:
              'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct\n...',
          details: 'Movie',
          releaseDate: DateTime.now().add(
            const Duration(days: 40),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
          title: 'Stranger Things',
          coverImage: 'assets/images/movies/stranger_things.jpg',
          genres: [Genre.mystery],
          subtitle:
              'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 50),
          ),
          ageRating: AgeRating.unrestricted),
      Movie(
          title: 'The Witcher',
          coverImage: 'assets/images/movies/the_witcher.jpg',
          genres: [Genre.action],
          subtitle:
              'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts\n...',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 60),
          ),
          ageRating: AgeRating.restricted),
    ];
  }
}
