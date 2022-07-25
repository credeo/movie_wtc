import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/services/router_service.dart';

void initKiwi() {
  KiwiContainer().registerSingleton((container) => RouterService());
}
