import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class SearchProvider extends ChangeNotifier {
  List<Movie> _movies = KiwiContainer().resolve<MovieService>().suggestedMovies;
  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  SearchProvider() {
    notifyListeners();
  }

  void search() {
    Iterable<Movie> m = _movies.where((element) =>
        element.title.toLowerCase().contains(controller.text.toLowerCase()));
    for (Movie x in m) {
      print(x.title);
    }
    controller.notifyListeners();
  }
}
