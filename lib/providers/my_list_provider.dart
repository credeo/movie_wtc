import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/services/user_service.dart';

class MyListProvider extends ChangeNotifier {
  final _userService = KiwiContainer().resolve<UserService>();

  List<Movie> get myMovieList => _userService.myMoviesList;
}
