import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:livin_clone/screens/sample_screen.dart';
import 'package:livin_clone/screens/main_screen.dart';
import 'package:livin_clone/screens/onboarding/onboarding_page.dart';
import 'package:livin_clone/screens/splash/splash_screen.dart';
import 'package:register/register.dart';
import 'package:dependencies/dependencies.dart';

final GlobalKey<NavigatorState> _rootNavKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _mainNavKey =
    GlobalKey<NavigatorState>(debugLabel: 'dashboard');

// Go-Router Configuration
final GoRouter livinRouter = GoRouter(
  navigatorKey: _rootNavKey,
  routerNeglect: true,
  initialLocation: LivinRoutes.splash.path,
  routes: [
    splashRoute,
    onboardingRoute,
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _mainNavKey,
            routes: [
              GoRoute(
                path: LivinRoutes.main.path,
                name: LivinRoutes.main.name,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/promo",
                builder: (context, state) => const SampleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/message",
                builder: (context, state) => const SampleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/settings",
                builder: (context, state) => const SampleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/logout",
                builder: (context, state) => const SampleScreen(),
              ),
            ],
          ),
        ])
  ],
);

// splash
final GoRoute splashRoute = GoRoute(
    path: LivinRoutes.splash.path,
    name: LivinRoutes.splash.name,
    builder: (context, state) => const SplashScreen());

// onboarding
final GoRoute onboardingRoute = GoRoute(
    path: LivinRoutes.onboarding.path,
    name: LivinRoutes.onboarding.name,
    builder: (context, state) => const OnboardingPage(),
    routes: [registerRoute]);
