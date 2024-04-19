import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/products/data/models/products_list_model.dart';
import 'package:ecommerce_sample/src/features/products/data/models/products_model.dart';
import 'package:ecommerce_sample/src/features/products/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({
    required this.networkClient,
  });

  final NetworkClient networkClient;

  @override
  Future<Response<ProductModel>> getProduct(String id) async {
    final response = await networkClient.get(
      '/products/$id',
      fromJsonFunction: ProductModel.fromMap,
    );

    return response;
  }

  @override
  Future<Response<List<ProductModel>>> getProducts(num skip) async {
    final response = await networkClient.get(
      '/products',
      fromJsonFunction: ProductListModel.fromJson,
      queryParameters: {
        'skip': skip,
      },
    );

    return response.flatMap(
      (data) => right(data.products),
    );
  }
}
