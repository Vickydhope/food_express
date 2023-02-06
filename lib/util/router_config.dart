import 'package:flutter/material.dart';
import 'package:food_express/view/app_scaffold.dart';
import 'package:food_express/view/cart/cart_page.dart';
import 'package:food_express/view/dashboard/dashboard_page.dart';
import 'package:food_express/view/dish_details/dish_details_page.dart';
import 'package:food_express/view/frosted/frosted_page.dart';
import 'package:food_express/view/messages/messages_page.dart';
import 'package:food_express/view/profile/profile_page.dart';
import 'package:food_express/view/restaurant/restaurant_page.dart';
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
            return CustomTransitionPage(
                key: state.pageKey,
                child: const DashboardPage(),
                transitionDuration: const Duration(milliseconds: 150),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInCubic)
                          .animate(animation),
                      child: child);
                });
          },
          routes: [
            GoRoute(
                path: 'restaurant',
                builder: (context, state) => RestaurantPage(
                      restaurantName: state.extra as String,
                    ),
                routes: [
                  GoRoute(
                    path: 'product',
                    builder: (context, state) => DishDetailsPage(
                      dishName: state.extra as String,
                    ),
                  ),
                ]),
          ],
        ),
        GoRoute(
          path: '/account',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                key: state.pageKey,
                child: const ProfilePage(),
                transitionDuration: const Duration(milliseconds: 150),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInCubic)
                          .animate(animation),
                      child: child);
                });
          },
        ),
        GoRoute(
          path: '/cart',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                key: state.pageKey,
                child: const CartPage(),
                transitionDuration: const Duration(milliseconds: 150),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInCubic)
                          .animate(animation),
                      child: child);
                });
          },
        ),
        GoRoute(
          path: '/messages',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                key: state.pageKey,
                child: const MessagesPage(),
                transitionDuration: const Duration(milliseconds: 150),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInCubic)
                          .animate(animation),
                      child: child);
                });
          },
        ),
      ],
    ),
  ],
);
