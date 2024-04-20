import 'package:ecommerce_sample/src/features/products/data/models/products_list_model.dart';
import 'package:ecommerce_sample/src/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_sample/src/features/products/presentations/providers/providers.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/product_screen_detail.dart';
import 'package:ecommerce_sample/src/features/products/presentations/screens/products_screens_list.dart';
import 'package:ecommerce_sample/src/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  late ProductRepository productRepository;
  late GoRouter mockRouter;

  setUp(() {
    productRepository = MockProductRepository();
    mockRouter = MockGoRouter();
  });
  testWidgets(
    'product screen detail ...',
    (tester) async {
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

      when(() => productRepository.getProducts(0))
          .thenAnswer((invocation) async {
        return right(
          ProductListModel.fromJson(json).products,
        );
      });

      when(
        () => mockRouter.push(any(), extra: any(named: 'extra')),
      ).thenAnswer(
        (_) async => ProductScreenDetail(
          product: ProductListModel.fromJson(json).products.first.toEntity(),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            productRepositoryProvider.overrideWithValue(
              productRepository,
            ),
          ],
          child: InheritedGoRouter(
            goRouter: mockRouter,
            child: MaterialApp(
              title: 'Sample Ecommerce',
              localizationsDelegates: AppLocalization.localizationsDelegates,
              supportedLocales: AppLocalization.supportedLocales,
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
                useMaterial3: true,
              ),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              builder: (context, child) => Scaffold(body: ProductsScreens()),
            ),
          ),
        ),
      );

      expect(find.byType(ProductsScreens), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.text("iPhone 9"), findsOneWidget);

      expect(find.text("iPhone X"), findsOneWidget);

      expect(find.text("Samsung Universe 9"), findsOneWidget);

      await tester.tap(find.text("Samsung Universe 9"));

      verify(
        () => mockRouter.push(
          ProductScreenDetail.route,
          extra: any(named: 'extra'),
        ),
      ).called(1);
    },
  );
}
