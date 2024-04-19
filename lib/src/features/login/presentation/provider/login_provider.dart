import 'package:ecommerce_sample/core/network_client/network_provider.dart';
import 'package:ecommerce_sample/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:ecommerce_sample/src/features/login/domain/entities/auth_entity.dart';
import 'package:ecommerce_sample/src/features/login/domain/repositories/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
LoginRepository providerRepository(ProviderRepositoryRef ref) {
  return LoginRepositoryImpl(
    client: ref.watch(apiHttpClientProvider),
  );
}

@riverpod
class LoginProvider extends _$LoginProvider {
  @override
  FutureOr<AuthEntity> build(String user, String password) async {
    state = const AsyncLoading();

    final response = await ref.watch(providerRepositoryProvider).getAuth(
          user,
          password,
        );

    return response.fold(
      (error) => throw error,
      (data) => data.toEntity(),
    );
  }
}
