import 'package:flutter/material.dart';
import 'package:food_express/view/app_scaffold.dart';
import 'package:food_express/view/dashboard/dashboard_page.dart';
import 'package:food_express/view/dish_details/dish_details_page.dart';
import 'package:food_express/view/profile/profile_page.dart';
import 'package:food_express/view/restaurant_page/restaurant_page.dart';
import 'package:go_router/go_router.dart';

var _shellNavigatorKey = GlobalKey<NavigatorState>();
var _rootNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  key: state.pageKey, child: const DashboardPage());
            },
            routes: [
              GoRoute(
                path: 'restaurant',
                builder: (context, state) => RestaurantPage(
                  restaurantName: state.extra as String,
                ),
              ),
            ]),
        GoRoute(
          path: '/account',
          pageBuilder: (context, state) {
            return NoTransitionPage(key: state.pageKey, child: ProfilePage());
          },
        ),
        GoRoute(
          path: '/cart',
          pageBuilder: (context, state) {
            return NoTransitionPage(
                key: state.pageKey, child: const DashboardPage());
          },
        ),
        GoRoute(
          path: '/messages',
          pageBuilder: (context, state) {
            return NoTransitionPage(
                key: state.pageKey, child: const DashboardPage());
          },
        ),
      ],
    ),
  ],
);
