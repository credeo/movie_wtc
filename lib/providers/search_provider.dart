import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class SearchProvider extends ChangeNotifier {
  final List<Movie> _movies =
      KiwiContainer().resolve<MovieService>().suggestedMovies;

  late Iterable<Movie> _searched;
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;
  List<Movie> get movies => List.unmodifiable(_movies);
  Iterable<Movie> get searched => List.unmodifiable(_searched);

  SearchProvider() {}

  void search() {
    _searched = _movies.where((element) =>
        element.title.toLowerCase().contains(controller.text.toLowerCase()));
    //print(_searched);
    notifyListeners();
  }
}
