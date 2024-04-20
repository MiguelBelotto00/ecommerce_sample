import 'package:ecommerce_sample/src/features/products/data/models/products_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Product Model', () {
    test('Should return the correct model', () {
      final json = {
        "products": [
          {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail":
                "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
            "images": [
              "https://cdn.dummyjson.com/product-images/1/1.jpg",
              "https://cdn.dummyjson.com/product-images/1/2.jpg",
              "https://cdn.dummyjson.com/product-images/1/3.jpg",
              "https://cdn.dummyjson.com/product-images/1/4.jpg",
              "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
            ]
          },
          {
            "id": 2,
            "title": "iPhone X",
            "description":
                "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            "price": 899,
            "discountPercentage": 17.94,
            "rating": 4.44,
            "stock": 34,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail":
                "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg",
            "images": [
              "https://cdn.dummyjson.com/product-images/2/1.jpg",
              "https://cdn.dummyjson.com/product-images/2/2.jpg",
              "https://cdn.dummyjson.com/product-images/2/3.jpg",
              "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"
            ]
          },
          {
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
          },
        ],
        "total": 100,
        "skip": 0,
        "limit": 30
      };

      final product = ProductListModel.fromJson(json);

      expect(product.products.first.id, 1);
      expect(product.products.first.title, "iPhone 9");
      expect(product.products.first.price, 549);
      expect(product.products.first.discountPercentage, 12.96);
      expect(product.products.first.rating, 4.69);
      expect(product.products.first.stock, 94);
      expect(product.products.first.brand, "Apple");
      expect(
        product.products.first.thumbnail,
        'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
      );

      expect(product.products.last.id, 3);
      expect(product.products.last.title, 'Samsung Universe 9');
      expect(product.products.last.price, 1249);
      expect(product.products.last.discountPercentage, 15.46);
      expect(product.products.last.rating, 4.09);
      expect(product.products.last.stock, 36);
      expect(product.products.last.brand, "Samsung");
      expect(
        product.products.last.thumbnail,
        'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
      );
    });

    test(
      'Should convert correctly to entity',
      () {
        final json = {
          "products": [
            {
              "id": 1,
              "title": "iPhone 9",
              "description": "An apple mobile which is nothing like apple",
              "price": 549,
              "discountPercentage": 12.96,
              "rating": 4.69,
              "stock": 94,
              "brand": "Apple",
              "category": "smartphones",
              "thumbnail":
                  "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
              "images": [
                "https://cdn.dummyjson.com/product-images/1/1.jpg",
                "https://cdn.dummyjson.com/product-images/1/2.jpg",
                "https://cdn.dummyjson.com/product-images/1/3.jpg",
                "https://cdn.dummyjson.com/product-images/1/4.jpg",
                "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
              ]
            },
            {
              "id": 2,
              "title": "iPhone X",
              "description":
                  "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
              "price": 899,
              "discountPercentage": 17.94,
              "rating": 4.44,
              "stock": 34,
              "brand": "Apple",
              "category": "smartphones",
              "thumbnail":
                  "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg",
              "images": [
                "https://cdn.dummyjson.com/product-images/2/1.jpg",
                "https://cdn.dummyjson.com/product-images/2/2.jpg",
                "https://cdn.dummyjson.com/product-images/2/3.jpg",
                "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"
              ]
            },
            {
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
            },
          ],
          "total": 100,
          "skip": 0,
          "limit": 30
        };

        final product = ProductListModel.fromJson(json).toEntity();

        expect(product.products.first.id, 1);
        expect(product.products.first.title, "iPhone 9");
        expect(product.products.first.price, 549);
        expect(product.products.first.discountPercentage, 12.96);
        expect(product.products.first.rating, 4.69);
        expect(product.products.first.stock, 94);
        expect(product.products.first.brand, "Apple");
        expect(
          product.products.first.thumbnail,
          'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
        );

        expect(product.products.last.id, 3);
        expect(product.products.last.title, 'Samsung Universe 9');
        expect(product.products.last.price, 1249);
        expect(product.products.last.discountPercentage, 15.46);
        expect(product.products.last.rating, 4.09);
        expect(product.products.last.stock, 36);
        expect(product.products.last.brand, "Samsung");
        expect(
          product.products.last.thumbnail,
          'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
        );
      },
    );
  });
}
