import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/models/user.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];
  final List<Movie> _notifyUser = [];
  User? _user;

  User? get user => _user;
  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);
  //check notification provider
  List<Movie> get notifyUserList => _notifyUser;

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

  void addToNotifyUser(Movie movie) {
    _notifyUser.add(movie);
    print(_notifyUser.length);
    notifyListeners();
  }

  bool isMovieInNotifyUser(Movie movie) {
    return _notifyUser.contains(movie);
  }

  void removeFromNotifyUser(Movie movie) {
    _notifyUser.remove(movie);
    notifyListeners();
  }
}
