import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class CategoriesProvider extends ChangeNotifier {
  final Map<String, List<Movie>> _map = <String, List<Movie>>{};
  final List<Movie> _movies =
      KiwiContainer().resolve<MovieService>().suggestedMovies;

  Map<String, List<Movie>> get map => _map;

  CategoriesProvider() {
    for (Movie m in _movies) {
      for (int i = 0; i < m.genres.length; i++) {
        _map.putIfAbsent(m.genres[i].value, () => []);
        _map[m.genres[i].value]!.add(m);
      }
    }
  }
}
