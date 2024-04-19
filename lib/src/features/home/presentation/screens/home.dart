import 'package:ecommerce_sample/src/features/home/presentation/widgets/appbar_homer.dart';
import 'package:ecommerce_sample/src/features/home/presentation/widgets/drawer_home.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/favorite_products_screen.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/products_screens_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

class Home extends ConsumerWidget {
  const Home({super.key});

  static const String name = 'home';
  static const String route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerHome(),
      appBar: AppBarHome(),
      body: ProductsScreens(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1)
              GoRouter.of(context).push(FavoriteProductsScreen.route);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: 'favorite')
          ]),
    );
  }
}
