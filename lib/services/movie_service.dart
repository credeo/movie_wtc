import 'package:movie_wtc/models/movie.dart';
import 'package:collection/collection.dart';

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

  Movie? getMovieWithId(String id) {
    var movie = _suggestedMovies.firstWhereOrNull((element) => element.id == id);
    movie ??= _comingSoonMovies.firstWhereOrNull((element) => element.id == id);
    return movie;
  }
}
