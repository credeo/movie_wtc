import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/models/user.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];
  final List<Movie> _myNotificationsList = [];
  User? _user;

  User? get user => _user;
  List<Movie> get myMoviesList => List.unmodifiable(_myMoviesList);
  List<Movie> get myNotificationsList =>
      List.unmodifiable(_myNotificationsList);

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

  void addNotification(Movie movie) {
    if (!_myNotificationsList.contains(movie)) {
      _myNotificationsList.add(movie);
      notifyListeners();
    }
  }

  void removeNotification(Movie movie) {
    _myNotificationsList.remove(movie);
    notifyListeners();
  }

  void clearNotifications() {
    _myNotificationsList.clear();
    notifyListeners();
  }

  bool isMovieInNotifications(Movie movie) {
    return _myNotificationsList.contains(movie);
  }
}
