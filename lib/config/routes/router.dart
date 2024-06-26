import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/screens/profile_screen.dart';
import 'package:cat_app/interface/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: AppRoutes.baseRoute,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.baseRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.random,
              pageBuilder: (context, state) => const MaterialPage(
                child: RandomScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, state) => const MaterialPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              pageBuilder: (context, state) => const MaterialPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return NavigatorScreen(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
    )
  ],
);
