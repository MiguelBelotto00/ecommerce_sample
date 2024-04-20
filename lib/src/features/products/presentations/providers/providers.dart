import 'package:ecommerce_sample/core/network_client/network_provider.dart';
import 'package:ecommerce_sample/src/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_sample/src/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce_sample/src/features/products/domain/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
    networkClient: ref.read(apiHttpClientProvider),
  );
}

@riverpod
class ProductProvider extends _$ProductProvider {
  @override
  FutureOr<List<ProductEntity>> build() async {
    state = AsyncLoading();
    final response = await ref.read(productRepositoryProvider).getProducts(0);
    return response.fold(
      (error) => throw error,
      (data) => data.map((product) => product.toEntity()).toList(),
    );
  }

  void loadMore(num skip) async {
    final response =
        await ref.read(productRepositoryProvider).getProducts(skip);
    state = response.fold(
      (error) => throw error,
      (data) => state.copyWithPrevious(
        AsyncData(
          data.map((product) => product.toEntity()).toList(),
        ),
      ),
    );
  }
}

@Riverpod(keepAlive: true)
class FavoriteProducts extends _$FavoriteProducts {
  @override
  List<ProductEntity> build() {
    return [];
  }

  bool isFavorite(ProductEntity product) {
    return state.where((element) => element.id == product.id).isNotEmpty;
  }

  void addToFavorites(ProductEntity product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }
}

@Riverpod(keepAlive: true)
class CartProducts extends _$CartProducts {
  @override
  List<ProductEntity> build() {
    return [];
  }

  void addToCart(ProductEntity product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  void buyCart() {
    ref.invalidateSelf();
  }
}
