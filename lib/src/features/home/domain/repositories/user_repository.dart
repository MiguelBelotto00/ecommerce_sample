import 'package:ecommerce_sample/core/network_client/network_client.dart';
import 'package:ecommerce_sample/src/features/home/data/models/user_model.dart';

abstract class UserRepository {
  Future<Response<UserModel>> getUser();
}
