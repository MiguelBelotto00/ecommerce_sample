import 'package:ecommerce_sample/core/network_client/api_exception.dart';
import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/products/data/models/products_list_model.dart';
import 'package:ecommerce_sample/src/features/products/data/models/products_model.dart';
import 'package:ecommerce_sample/src/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient client;
  late ProductRepositoryImpl productRepositoryImpl;
  group('Test Get Products', () {
    setUp(() {
      client = MockNetworkClient();
      productRepositoryImpl = ProductRepositoryImpl(networkClient: client);
    });
    test(
      'getProducts should return a list of products',
      () async {
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

        final productList = ProductListModel.fromJson(json).products;

        when(() => client.get(
              '/products',
              fromJsonFunction: ProductListModel.fromJson,
              queryParameters: {
                'skip': 0,
              },
            )).thenAnswer(
          (_) async => right(
            ProductListModel.fromJson(json),
          ),
        );

        final result = await productRepositoryImpl.getProducts(0);

        result.fold(
          (l) => null,
          (result) {
            expect(
              result,
              isA<List<ProductModel>>(),
            );
            expect(result.first.id, productList.first.id);
            expect(result[1].id, productList[1].id);
            expect(result.last.id, productList.last.id);
          },
        );
      },
    );

    test('Should dont find product return ApiException', () async {
      when(() => client.get(
            '/products',
            fromJsonFunction: ProductListModel.fromJson,
            queryParameters: {
              'skip': 0,
            },
          )).thenAnswer(
        (_) async => left(
          ApiException.defautResponse,
        ),
      );

      final result = await productRepositoryImpl.getProducts(0);

      result.fold((l) {
        expect(l, isA<ApiException>());
        expect(l.message, 'Ha ocurrido un error');
      }, (result) => null);
    });
  });

  group(
    'Test Get Product',
    () {
      setUp(() {
        client = MockNetworkClient();
        productRepositoryImpl = ProductRepositoryImpl(networkClient: client);
      });
      test(
        'getProducts should return a list of products',
        () async {
          final json = {
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
          };

          final product = ProductModel.fromMap(json);

          when(() => client.get(
                '/products/1',
                fromJsonFunction: ProductModel.fromMap,
              )).thenAnswer(
            (_) async => right(
              ProductModel.fromMap(json),
            ),
          );

          final result = await productRepositoryImpl.getProduct('1');

          result.fold(
            (l) => null,
            (result) {
              expect(
                result,
                isA<ProductModel>(),
              );
              expect(result.id, product.id);
              expect(result.title, product.title);
              expect(result.price, product.price);
              expect(result.discountPercentage, product.discountPercentage);
              expect(result.rating, product.rating);
              expect(result.stock, product.stock);
            },
          );
        },
      );

      test(
        'Should dont find product return ApiException',
        () async {
          when(() => client.get(
                '/products/1',
                fromJsonFunction: ProductModel.fromMap,
              )).thenAnswer(
            (_) async => left(
              ApiException.defautResponse,
            ),
          );

          final result = await productRepositoryImpl.getProduct('1');

          result.fold((l) {
            expect(l, isA<ApiException>());
            expect(l.message, 'Ha ocurrido un error');
          }, (result) => null);
        },
      );
    },
  );
}
