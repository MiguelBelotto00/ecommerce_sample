import 'dart:math';

import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/home/data/models/user_model.dart';
import 'package:ecommerce_sample/src/features/home/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.networkClient,
  });

  final NetworkClient networkClient;

  @override
  Future<Response<UserModel>> getUser() {
    final int random = Random().nextInt(100);

    return networkClient.get(
      '/user/$random',
      fromJsonFunction: UserModel.fromJson,
    );
  }
}
