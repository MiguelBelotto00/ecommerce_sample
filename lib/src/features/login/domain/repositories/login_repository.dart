import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/login/data/models/auth_model.dart';

abstract class LoginRepository {
  Future<Response<AuthModel>> getAuth(String user, String password);
}
