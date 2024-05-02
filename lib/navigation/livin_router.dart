import 'package:flutter/material.dart';
import 'package:livin_clone/screens/onboarding/onboarding_page.dart';
import 'package:livin_clone/screens/splash/splash_screen.dart';
import 'package:shared/shared.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// Go-Router Configuration
final GoRouter livinRouter = GoRouter(
  navigatorKey: _rootNavKey,
  routerNeglect: true,
  initialLocation: LivinRoutes.splash.path,
  routes: [splashRoute, onboardingRoute],
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
    builder: (context, state) => const OnboardingPage());
