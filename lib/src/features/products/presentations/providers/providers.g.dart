// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'a0aa963c94259be65a91a4231c34f4eb410413b7';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productProviderHash() => r'4f81e24269f58416763a8282376805040214e031';

/// See also [ProductProvider].
@ProviderFor(ProductProvider)
final productProviderProvider = AutoDisposeAsyncNotifierProvider<
    ProductProvider, List<ProductEntity>>.internal(
  ProductProvider.new,
  name: r'productProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductProvider = AutoDisposeAsyncNotifier<List<ProductEntity>>;
String _$favoriteProductsHash() => r'84e627c5ff950489659437bedc8e75b51c0da89a';

/// See also [FavoriteProducts].
@ProviderFor(FavoriteProducts)
final favoriteProductsProvider =
    NotifierProvider<FavoriteProducts, List<ProductEntity>>.internal(
  FavoriteProducts.new,
  name: r'favoriteProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteProducts = Notifier<List<ProductEntity>>;
String _$cartProductsHash() => r'72529f3d2e5fc4f635402d2c5298f0978a69238d';

/// See also [CartProducts].
@ProviderFor(CartProducts)
final cartProductsProvider =
    NotifierProvider<CartProducts, List<ProductEntity>>.internal(
  CartProducts.new,
  name: r'cartProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartProducts = Notifier<List<ProductEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
