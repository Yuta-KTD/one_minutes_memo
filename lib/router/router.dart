import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/repository/auth_repository.dart';
import 'package:one_minutes_memo/view/auth/sign_in_screen.dart';
import 'package:one_minutes_memo/view/auth/sign_up_screen.dart';
import 'package:one_minutes_memo/view/memo/add_memo_sceen.dart';
import 'package:one_minutes_memo/view/memo/title_screen.dart';

final routerProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    ref.keepAlive();
    final authState = ref.watch(authStateChangesProvider);
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SignInScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'signup',
              builder: (context, state) => const SignUpScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/title',
          builder: (context, state) => TitleScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'addmemo',
              builder: (context, state) => const AddMemoScreen(),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        if (authState.isLoading || authState.hasError) return null;
        if (authState.valueOrNull == null) return null;
        return '/title';
      },
    );
  },
);
