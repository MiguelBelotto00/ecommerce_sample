import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoriteProductsScreen extends ConsumerWidget {
  static const route = '/favorite';
  static const name = 'favorite';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoriteProductsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: favorite.length == 0
          ? Center(child: Text('No tienes nada agregado a favoritos'))
          : ListView.builder(
              itemCount: favorite.length,
              itemBuilder: (context, index) {
                final product = favorite[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      product.images.first,
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: IconButton(
                    icon: Icon(
                      ref
                              .watch(favoriteProductsProvider.notifier)
                              .isFavorite(product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () {
                      ref
                          .watch(favoriteProductsProvider.notifier)
                          .addToFavorites(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
