import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/core/helpers/default_styles.dart';
import 'package:ecommerce_sample/core/helpers/extensions.dart';
import 'package:ecommerce_sample/src/features/home/presentation/providers/providers.dart';
import 'package:ecommerce_sample/src/features/login/presentation/screens/login.dart';
import 'package:ecommerce_sample/src/features/my_data/presentation/screens/my_data_screen.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/favorite_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawerHome extends ConsumerWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: userData.when(
                  data: (data) => ListView(
                        children: [
                          CircleAvatar(
                            child: CachedNetworkImage(imageUrl: data.image),
                            maxRadius: 30,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            context.l10n.welcomeMessage(
                                '${data.firstName} ${data.lastName}'),
                            style: DefaultStyles.boldTitle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            data.email,
                            style: DefaultStyles.regularTitle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  loading: () => CircularProgressIndicator(
                        color: Colors.white,
                      ),
                  error: (error, stackTrace) => Text(
                        context.l10n.welcome,
                        style: DefaultStyles.boldTitle.copyWith(
                          color: Colors.white,
                        ),
                      )),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(FavoriteProductsScreen.name);
              },
              child: Text(
                context.l10n.myFavorites,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(
                  MyDataScreen.route,
                );
              },
              child: Text(
                context.l10n.myData,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                '${context.l10n.appVersion} 1.0.0',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(Login.route);
              },
              child: Text(
                context.l10n.logout,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
