import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/movie_service.dart';

class SearchProvider extends ChangeNotifier {
  final List<Movie> _movies =
      KiwiContainer().resolve<MovieService>().suggestedMovies;
  Iterable<Movie> _searched = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _productionController = TextEditingController();
  String _category = 'Any';
  String _duration = 'Any';
  bool _flag = false;

  final List<DropdownMenuItem<String>> _categories = [
    const DropdownMenuItem(
      child: Text('Any'),
      value: 'Any',
    ),
    const DropdownMenuItem(
      child: Text('Romance'),
      value: 'Romance',
    ),
    const DropdownMenuItem(
      child: Text('Comedy'),
      value: 'Comedy',
    ),
    const DropdownMenuItem(
      child: Text('Horror'),
      value: 'Horror',
    ),
    const DropdownMenuItem(
      child: Text('Action'),
      value: 'Action',
    ),
    const DropdownMenuItem(
      child: Text('Mystery'),
      value: 'Mystery',
    )
  ];

  final List<DropdownMenuItem<String>> _durations = [
    const DropdownMenuItem(
      child: Text('Any'),
      value: 'Any',
    ),
    const DropdownMenuItem(
      child: Text('<60min'),
      value: '60',
    ),
    const DropdownMenuItem(
      child: Text('60-120min'),
      value: '120',
    ),
    const DropdownMenuItem(
      child: Text('>120min'),
      value: '121',
    ),
  ];

  TextEditingController get controller => _controller;
  TextEditingController get productionController => _productionController;
  List<Movie> get movies => List.unmodifiable(_movies);
  List<DropdownMenuItem<String>> get categories =>
      List.unmodifiable(_categories);
  List<DropdownMenuItem<String>> get durations => List.unmodifiable(_durations);

  bool get flag => _flag;
  String get category => _category;
  String get duration => _duration;

  Iterable<Movie> get searched => List.unmodifiable(_searched);

  void setCategory(String a) {
    _category = a;
    notifyListeners();
  }

  void setDuration(String a) {
    _duration = a;
    notifyListeners();
  }

  void search() {
    _searched = _movies.where((element) =>
        element.title.toLowerCase().contains(controller.text.toLowerCase()));
    //print(_searched);
    notifyListeners();
  }

  void searchBottomSheet() {
    _flag = true;

    print(category);
    print(duration);

    List<Movie> lista = [];
    if (category != 'Any') {
      for (Movie m in _movies) {
        for (int i = 0; i < m.genres.length; i++) {
          if (m.genres[i].value.toLowerCase() == category.toLowerCase()) {
            lista.add(m);
            break;
          }
        }
      }
    } else {
      lista = List.from(_movies);
    }

    if (duration != 'Any') {
      if (duration == '60') {
        lista.removeWhere((element) => element.length > 60);
      } else if (duration == '120') {
        lista.removeWhere(
            (element) => element.length < 60 || element.length > 120);
      } else {
        lista.removeWhere((element) => element.length < 120);
      }
    }
    print(lista);

    if (productionController.text != '') {
      int year = int.parse(productionController.text);
      for (int i = 0; i < lista.length; i++) {
        if (lista[i].releaseDate.year != year) {
          print(lista[i].releaseDate.year);
          lista.removeAt(i);
          i--;
        }
      }
    }

    print(lista);
    _searched = lista as Iterable<Movie>;
    notifyListeners();
  }
}
