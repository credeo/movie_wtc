import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/services/appearance_service.dart';
import 'package:movie_wtc/services/movie_service.dart';
import 'package:movie_wtc/services/router_service.dart';
import 'package:movie_wtc/services/user_service.dart';

void initKiwi() {
  KiwiContainer().registerSingleton((container) => RouterService());
  KiwiContainer().registerSingleton((container) => AppearanceService());
  KiwiContainer().registerSingleton((container) => MovieService());
  KiwiContainer().registerSingleton((container) => UserService());
}
