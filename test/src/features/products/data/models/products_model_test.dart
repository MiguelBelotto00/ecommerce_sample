import 'package:ecommerce_sample/src/features/products/data/models/products_model.dart';
import 'package:ecommerce_sample/src/features/products/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Product Model', () {
    test('fromJson should return correct model', () {
      final json = {
        "id": 3,
        "title": "Samsung Universe 9",
        "description":
            "Samsung's new variant which goes beyond Galaxy to the Universe",
        "price": 1249,
        "discountPercentage": 15.46,
        "rating": 4.09,
        "stock": 36,
        "brand": "Samsung",
        "category": "smartphones",
        "thumbnail": "https://cdn.dummyjson.com/product-images/3/thumbnail.jpg",
        "images": ["https://cdn.dummyjson.com/product-images/3/1.jpg"]
      };

      final product = ProductModel.fromMap(json);

      expect(product.id, 3);
      expect(product.title, 'Samsung Universe 9');
      expect(product.price, 1249);
      expect(product.discountPercentage, 15.46);
      expect(product.rating, 4.09);
      expect(product.stock, 36);
      expect(product.brand, "Samsung");
      expect(
        product.thumbnail,
        'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
      );
    });

    test(
      'FromEmpty should return an empty model(Initialized data)',
      () {
        final json = {
          "id": 3,
          "title": "Samsung Universe 9",
          "description":
              "Samsung's new variant which goes beyond Galaxy to the Universe",
          "price": 1249,
          "discountPercentage": 15.46,
          "rating": 4.09,
          "stock": 36,
          "brand": "Samsung",
          "category": "smartphones",
          "thumbnail":
              "https://cdn.dummyjson.com/product-images/3/thumbnail.jpg",
          "images": ["https://cdn.dummyjson.com/product-images/3/1.jpg"]
        };

        final product = ProductModel.fromMap(json).toEntity();

        expect(product, isA<ProductEntity>());
        expect(product.id, 3);
        expect(product.title, 'Samsung Universe 9');
        expect(product.price, 1249);
        expect(product.discountPercentage, 15.46);
        expect(product.rating, 4.09);
        expect(product.stock, 36);
        expect(product.brand, "Samsung");
        expect(
          product.thumbnail,
          'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
        );
      },
    );
  });
}
