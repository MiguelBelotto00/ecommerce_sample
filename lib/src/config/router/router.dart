import 'package:ecommerce_sample/src/features/home/presentation/screens/home.dart';
import 'package:ecommerce_sample/src/features/login/presentation/screens/login.dart';
import 'package:ecommerce_sample/src/features/my_data/presentation/screens/my_data_screen.dart';
import 'package:ecommerce_sample/src/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/cart_products_screen.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/favorite_products_screen.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/product_screen_detail.dart';
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
      name: MyDataScreen.name,
      path: MyDataScreen.route,
      builder: (context, state) => const MyDataScreen(),
    ),
    GoRoute(
      name: FavoriteProductsScreen.name,
      path: FavoriteProductsScreen.route,
      builder: (context, state) {
        return FavoriteProductsScreen();
      },
    ),
    GoRoute(
      name: ProductScreenDetail.name,
      path: ProductScreenDetail.route,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final product = extra['product'] as ProductEntity;
        return ProductScreenDetail(product: product);
      },
    ),
    GoRoute(
      name: CartProductsScreen.name,
      path: CartProductsScreen.route,
      builder: (context, state) {
        return CartProductsScreen();
      },
    ),
  ],
);
