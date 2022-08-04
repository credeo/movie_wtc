import 'package:movie_wtc/models/movie.dart';

class MovieService {
  List<Movie> _suggestedMovies = [];
  List<Movie> _comingSoonMovies = [];

  List<Movie> get suggestedMovies => List.unmodifiable(_suggestedMovies);
  List<Movie> get comingSoonMovies => List.unmodifiable(_comingSoonMovies);

  Future<void> fetchSuggestedMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _suggestedMovies = [
      Movie.test(0),
      Movie.test(1),
      Movie.test(2),
      Movie.test(3),
    ];
  }

  Future<void> fetchComingSoonMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    _comingSoonMovies = [
      Movie.test(0),
      Movie.test(1),
      Movie.test(2),
      Movie.test(3),
    ];
  }
}
