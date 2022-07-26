import 'package:go_router/go_router.dart';
import 'package:movie_wtc/pages/empty_page.dart';
import 'package:movie_wtc/pages/login_page.dart';

class RouterService {
  late final GoRouter _goRouter;

  GoRouter get router => _goRouter;

  RouterService() {
    _buildRouter();
  }

  void _buildRouter() {
    _goRouter = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (context, state) => const EmptyPage(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const LoginPage(),
            ),
          ],
        ),
      ],
    );
  }

  // @override
  // String get className => 'Router Service';
}
