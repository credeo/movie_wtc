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
      value: 'Any',
      child: Text('Any'),
    ),
    const DropdownMenuItem(
      value: 'Romance',
      child: Text('Romance'),
    ),
    const DropdownMenuItem(
      value: 'Comedy',
      child: Text('Comedy'),
    ),
    const DropdownMenuItem(
      value: 'Horror',
      child: Text('Horror'),
    ),
    const DropdownMenuItem(
      value: 'Action',
      child: Text('Action'),
    ),
    const DropdownMenuItem(
      value: 'Mystery',
      child: Text('Mystery'),
    )
  ];

  final List<DropdownMenuItem<String>> _durations = [
    const DropdownMenuItem(
      value: 'Any',
      child: Text('Any'),
    ),
    const DropdownMenuItem(
      value: '60',
      child: Text('<60min'),
    ),
    const DropdownMenuItem(
      value: '120',
      child: Text('60-120min'),
    ),
    const DropdownMenuItem(
      value: '121',
      child: Text('>120min'),
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

  @override
  void dispose() {
    _controller.dispose();
    _productionController.dispose();
    super.dispose();
  }

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

  bool areConditionsEmpty() {
    return _productionController.text == '' &&
        duration == 'Any' &&
        category == 'Any';
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
