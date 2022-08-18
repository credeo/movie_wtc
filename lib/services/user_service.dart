import 'package:flutter/foundation.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/models/user.dart';

class UserService extends ChangeNotifier {
  final List<Movie> _myMoviesList = [];
  User? _user;

  User? get user => _user;
  List<Movie> get myMoviesList => _myMoviesList;

  UserService() {
    _user = const User(name: 'Mr. X', email: 'johnappleased@gmail.com');
  }

  // void numOfNotification() {
  //   _myMoviesList.length;
  //   notifyListeners();
  // }

  void clearList() {
    myMoviesList.clear();
    notifyListeners();
  }

  void addToMyList(Movie movie) {
    _myMoviesList.add(movie);

    // notifyListeners();
  }

  void removeFromMyList(Movie movie) {
    _myMoviesList.remove(movie);

    //notifyListeners();
  }

  bool isMovieInMyList(Movie movie) {
    return _myMoviesList.contains(movie);
  }

  void changeName(String newName) {
    _user = _user?.copyWith(name: newName);
    notifyListeners();
  }
}
