import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/pages/login_page.dart';
import 'package:movie_wtc/pages/sing_up_page.dart';
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
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/sign_up_page',
          builder: (context, state) => const SignUpPage(),
        )
      ],
    );
  }

  // @override
  // String get className => 'Router Service';
}
