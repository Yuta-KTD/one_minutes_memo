import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../feature/auth/view/add_memo_sceen.dart';
import '../feature/auth/view/sign_in_screen.dart';
import '../feature/auth/view/sign_up_screen.dart';
import '../feature/auth/view/title_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
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
  ),
);
