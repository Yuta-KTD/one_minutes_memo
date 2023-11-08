import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/repository/auth_repository.dart';
import 'package:one_minutes_memo/view/auth/sign_in_screen.dart';
import 'package:one_minutes_memo/view/auth/sign_up_screen.dart';
import 'package:one_minutes_memo/view/memo/add_memo_sceen.dart';
import 'package:one_minutes_memo/view/memo/title_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateChangesProvider);
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      final isLoggedIn = authState.asData?.value != null;
      final isOnAuthScreen =
          state.matchedLocation == const SignInRoute().location ||
              state.matchedLocation == const SignUpRoute().location;
      if (!isLoggedIn && !isOnAuthScreen) return const SignInRoute().location;
      if (isLoggedIn && isOnAuthScreen) return const TitleRoute().location;
      return null;
    },
  );
}

@TypedGoRoute<SignInRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SignUpRoute>(path: 'signup'),
  ],
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

@TypedGoRoute<TitleRoute>(
  path: '/title',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AddMemoRoute>(path: 'addmemo'),
  ],
)
class TitleRoute extends GoRouteData {
  const TitleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TitleScreen();
  }
}

class AddMemoRoute extends GoRouteData {
  const AddMemoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddMemoScreen();
  }
}
