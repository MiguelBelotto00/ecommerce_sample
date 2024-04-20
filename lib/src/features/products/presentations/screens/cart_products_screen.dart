import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/core/helpers/default_styles.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartProductsScreen extends ConsumerWidget {
  static const route = '/cart';
  static const name = 'cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProductsProvider);
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
      body: cart.length == 0
          ? Center(child: Text('No tienes nada agregado a tu carrito'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      product.images.first,
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text(
                    '${product.price.toString()} USD.',
                    style: DefaultStyles.Title,
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            if (cart.length == 0) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Debes Agregar productos'),
                  ),
                );
              return;
            }

            GoRouter.of(context).pop();
            ref.read(cartProductsProvider.notifier).buyCart();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Compra realizada'),
                ),
              );
          },
          child: Text(
            'Comprar',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
