import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:one_minutes_memo/feature/auth/presentation/sign_in_screen.dart';
import 'package:one_minutes_memo/feature/auth/presentation/sign_up_screen.dart';
import 'package:one_minutes_memo/feature/memo/presentation/add_memo_sceen.dart';
import 'package:one_minutes_memo/feature/memo/presentation/title_screen.dart';

final routerProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateChangesProvier);
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen(),
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
