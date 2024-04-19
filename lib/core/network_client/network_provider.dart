import 'package:dio/dio.dart';
import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
NetworkClient apiHttpClient(ApiHttpClientRef ref) {
  return NetworkClient(
      dio: Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ),
  ));
}
