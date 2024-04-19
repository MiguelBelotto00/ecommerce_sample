import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsScreens extends ConsumerWidget {
  const ProductsScreens();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const limit = 30;
            final indexProduct = index % limit;
            final products = ref.watch(
              productProviderProvider,
            );
            return products.when(
              data: (data) {
                if (indexProduct >= data.length) {
                  return null;
                }
                final product = data[indexProduct];

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
                      ref.watch(favoriteProductsProvider).contains(product)
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
              error: (error, stackTrace) => SizedBox.shrink(),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
