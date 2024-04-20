import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/core/helpers/default_styles.dart';
import 'package:ecommerce_sample/src/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductScreenDetail extends ConsumerWidget {
  const ProductScreenDetail({
    required this.product,
    super.key,
  });
  final ProductEntity product;

  static const name = 'product_detail';
  static const route = '/product_detail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          '${product.title}',
          style: DefaultStyles.boldTitle.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: FlutterCarousel.builder(
                    itemCount: product.images.length,
                    itemBuilder: (context, index, realIndex) =>
                        CachedNetworkImage(
                      imageUrl: product.images[index],
                      fit: BoxFit.cover,
                    ),
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          product.category,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '${product.price.toString()} USD.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Descuento: ${product.discountPercentage.toString()}%',
                        style: DefaultStyles.regularTitle
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Ranking: ${product.rating.toString()}',
                        style: DefaultStyles.regularTitle
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        product.description,
                        style: DefaultStyles.regularTitle
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Agregado al carrito'),
                ),
              );
            ref.watch(cartProductsProvider.notifier).addToCart(product);
          },
          label: Text('Agregar al carrito'),
          icon: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
