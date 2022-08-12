import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class SearchProvider extends ChangeNotifier {
  final List<Movie> _movies =
      KiwiContainer().resolve<MovieService>().suggestedMovies;
  List<Movie> _searched = [];
  String _query = '';
  String _category = '';
  String _duration = '';
  String _productionYear = '';
  TextEditingController _textEditingController = TextEditingController();

  String get category => _category;
  String get duration => _duration;
  String get productionYear => _productionYear;
  String get query => _query;
  List<Movie> get movies => List.unmodifiable(_movies);
  List<Movie> get searched => List.unmodifiable(_searched);
  TextEditingController get textEditingController => _textEditingController;
  bool get isSearchActive =>
      _category.isNotEmpty ||
      _duration.isNotEmpty ||
      _productionYear.isNotEmpty ||
      _query.isNotEmpty;
  bool get isFiltersActive =>
      _category.isNotEmpty ||
      _duration.isNotEmpty ||
      _productionYear.isNotEmpty;

  void clearQuery() {
    _textEditingController.text = '';
    _query = '';
    notifyListeners();
  }

  void search(String query) {
    _query = query;
    applyFilters();
  }

  void applyFilters(
      {String? category, String? duration, String? productionYear}) {
    _category = category ?? _category;
    _duration = duration ?? _duration;
    _productionYear = productionYear ?? _productionYear;

    if (_category.isEmpty && _duration.isEmpty && _productionYear.isEmpty) {
      if (_query.isEmpty) {
        _searched = [];
      } else {
        _searched = _movies
            .where((element) =>
                element.title.toLowerCase().contains(_query.toLowerCase()))
            .toList();
      }
      notifyListeners();
      return;
    }

    List<Movie> list = [];
    if (_category.isNotEmpty) {
      for (Movie m in _movies) {
        for (int i = 0; i < m.genres.length; i++) {
          if (m.genres[i].value.toLowerCase() == _category.toLowerCase()) {
            list.add(m);
            break;
          }
        }
      }
    } else {
      list = List.from(_movies);
    }

    if (_duration.isNotEmpty) {
      if (_duration == '60') {
        list.removeWhere((element) => element.length > 60);
      } else if (_duration == '120') {
        list.removeWhere(
            (element) => element.length < 60 || element.length > 120);
      } else {
        list.removeWhere((element) => element.length < 120);
      }
    }

    if (_productionYear.isNotEmpty) {
      int year = int.parse(_productionYear);
      for (int i = 0; i < list.length; i++) {
        if (list[i].releaseDate.year != year) {
          list.removeAt(i);
          i--;
        }
      }
    }

    _searched = list;
    if (_query.isNotEmpty) {
      _searched = _searched
          .where((element) =>
              element.title.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
