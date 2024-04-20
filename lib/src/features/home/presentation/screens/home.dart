import 'package:ecommerce_sample/src/features/home/presentation/widgets/appbar_homer.dart';
import 'package:ecommerce_sample/src/features/home/presentation/widgets/drawer_home.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/cart_products_screen.dart';
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
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            if (value == 2)
              GoRouter.of(context).push(FavoriteProductsScreen.route);
            if (value == 1) GoRouter.of(context).push(CartProductsScreen.route);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: 'favorite')
          ]),
    );
  }
}
