import 'package:ecommerce_sample/src/features/home/presentation/screens/home.dart';
import 'package:ecommerce_sample/src/features/login/presentation/screens/login.dart';
import 'package:ecommerce_sample/src/features/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
    initialLocation: Login.route,
    debugLogDiagnostics: true,
    navigatorKey: globalNavigatorKey,
    routes: [
      GoRoute(
        name: Login.name,
        path: Login.route,
        parentNavigatorKey: globalNavigatorKey,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        name: Home.name,
        path: Home.route,
        parentNavigatorKey: globalNavigatorKey,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: OnboardingScreen.name,
        path: OnboardingScreen.route,
        parentNavigatorKey: globalNavigatorKey,
        builder: (context, state) => const OnboardingScreen(),
      ),
    ]);
