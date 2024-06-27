import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _navigatorKey = GlobalKey<NavigatorState>();
final _navigatorKey2 = GlobalKey<NavigatorState>();
final _navigatorKey3 = GlobalKey<NavigatorState>();

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
          navigatorKey: _navigatorKey3,
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
          navigatorKey: _navigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, state) => const MaterialPage(
                child: HomeScreen(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.catDetail,
                  pageBuilder: (context, state) => const MaterialPage(
                    child: CatDetailScreen(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorKey2,
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
