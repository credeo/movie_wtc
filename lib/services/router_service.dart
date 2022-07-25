import 'package:go_router/go_router.dart';
import 'package:movie_wtc/pages/empty_page.dart';

class RouterService {
  late final GoRouter _goRouter;

  GoRouter get router => _goRouter;

  RouterService() {
    _buildRouter();
  }

  void _buildRouter() {
    _goRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const EmptyPage(),
        ),
      ],
    );
  }

  // @override
  // String get className => 'Router Service';
}