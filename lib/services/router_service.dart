import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/pages/login_page.dart';
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
        final themeData =
            KiwiContainer().resolve<AppearanceService>().buildTheme();
        return Theme(
          data: themeData,
          child: child,
        );
      },
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: LoginPage.pageName,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: TabContainer.pageName,
          builder: (context, state) => const TabContainer(),
        ),
      ],
    );
  }

  // @override
  // String get className => 'Router Service';
}
