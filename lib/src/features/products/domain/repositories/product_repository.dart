import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/products/data/models/products_model.dart';

abstract class ProductRepository {
  Future<Response<List<ProductModel>>> getProducts(num skip);
  Future<Response<ProductModel>> getProduct(String id);
}
