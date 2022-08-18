import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstantPage<T> extends Page<T> {
  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.modalRoute.maintainState}
  final bool maintainState;

  const InstantPage({
    required this.child,
    this.maintainState = true,
    LocalKey? key,
    String? name,
    Object? arguments,
  }) : super(key: key, name: name, arguments: arguments);

  @override
  Route<T> createRoute(BuildContext context) {
    return _InstantPageRoute<T>(page: this);
  }
}

class _InstantPageRoute<T> extends PageRoute<T> with _InstantRouteTransitionMixin<T> {
  _InstantPageRoute({required InstantPage<T> page}) : super(settings: page);

  InstantPage<T> get _page => settings as InstantPage<T>;

  @override
  Widget buildContent(BuildContext context) {
    return _page.child;
  }

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => false;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}

mixin _InstantRouteTransitionMixin<T> on PageRoute<T> {
  /// Builds the primary contents of the route.
  @protected
  Widget? buildContent(BuildContext context);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 10);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialRouteTransitionMixin && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoRouteTransitionMixin && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget? result = buildContent(context);
    assert(() {
      if (result == null) {
        throw FlutterError('Error: The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
