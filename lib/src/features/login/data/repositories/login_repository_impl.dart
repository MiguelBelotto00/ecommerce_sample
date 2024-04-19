import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/login/data/models/auth_model.dart';
import 'package:ecommerce_sample/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl({
    required NetworkClient client,
  }) : _client = client;

  final NetworkClient _client;
  @override
  Future<Response<AuthModel>> getAuth(String user, String password) async {
    final response =
        _client.post('/auth', fromJsonFunction: AuthModel.fromMap, body: {
      'username': user,
      'password': password,
    });
    return response;
  }
}
