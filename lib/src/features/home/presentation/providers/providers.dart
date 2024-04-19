import 'package:ecommerce_sample/core/network_client/network_provider.dart';
import 'package:ecommerce_sample/src/features/home/data/repositories/user_repository_impl.dart';
import 'package:ecommerce_sample/src/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce_sample/src/features/home/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
    networkClient: ref.read(apiHttpClientProvider),
  );
}

@riverpod
class UserData extends _$UserData {
  @override
  FutureOr<UserEntity> build() async {
    state = AsyncLoading();
    final response = await ref.read(userRepositoryProvider).getUser();
    return response.fold((error) => throw error, (data) => data.toEntity());
  }
}
