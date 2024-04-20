import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/product_screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductsScreens extends ConsumerWidget {
  const ProductsScreens();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.custom(
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

              return SizedBox(
                height: 200,
                child: ListTile(
                    onTap: () => GoRouter.of(context)
                            .push(ProductScreenDetail.route, extra: {
                          'product': product,
                        }),
                    leading: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                        product.images.first,
                      ),
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            ref
                                    .watch(favoriteProductsProvider)
                                    .contains(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            ref
                                .watch(favoriteProductsProvider.notifier)
                                .addToFavorites(product);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text('Agregado al carrito'),
                                ),
                              );
                            ref
                                .watch(cartProductsProvider.notifier)
                                .addToCart(product);
                          },
                        ),
                      ],
                    )),
              );
            },
            error: (error, stackTrace) => SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
