import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/pages/login_page.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/pages/movie_player.dart';
import 'package:movie_wtc/pages/search.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/services/appearance_service.dart';

class RouterService {
  late final GoRouter _goRouter;
  GoRouter get router => _goRouter;
  RouterService() {
    _buildRouter();
  }
  void _buildRouter() {
    _goRouter = GoRouter(
      navigatorBuilder: (context, state, child) {
        final themeData = KiwiContainer().resolve<AppearanceService>().buildTheme();
        return Theme(
          data: themeData,
          child: child,
        );
      },
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/',
          name: LoginPage.pageName,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/search',
          name: SearchPage.pageName,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/home',
          name: TabContainer.pageName,
          builder: (context, state) => const TabContainer(),
          routes: [
            GoRoute(
              path: 'movie_player',
              name: MoviePlayer.pageNameFromHome,
              builder: (context, state) => MoviePlayer(movieId: state.extra as String),
            ),
            GoRoute(
              path: ':id',
              name: MovieDetails.pageName,
              builder: (context, state) => MovieDetails(movieId: state.params['id']!),
              routes: [
                GoRoute(
                  path: 'movie_player',
                  name: MoviePlayer.pageNameFromDetails,
                  builder: (context, state) => MoviePlayer(movieId: state.params['id']!),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
// @override
// String get className => ‘Router Service’;
}
