import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/models/user.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];
  final List<Movie> _notifyMe = [];
  User? _user;

  User? get user => _user;
  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);
  List<Movie> get notifyMeList => _notifyMe;

  UserService() {
    _user = const User(name: 'Mr. X', email: 'johnappleased@gmail.com');
  }

  void addToMyList(Movie movie) {
    _myMoviesList.add(movie);
    notifyListeners();
  }

  void removeFromMyList(Movie movie) {
    _myMoviesList.remove(movie);
    notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    return _myMoviesList.contains(movie);
  }

  void changeName(String newName) {
    _user = _user?.copyWith(name: newName);
    notifyListeners();
  }

  void addToNotifyMe(Movie movie) {
    _notifyMe.add(movie);
    print(_notifyMe.length);
    notifyListeners();
  }

  void removeFromNotifyMe(Movie movie) {
    _notifyMe.remove(movie);
    notifyListeners();
  }

  bool isMovieInNotifyMe(Movie movie) {
    return _notifyMe.contains(movie);
  }
}
