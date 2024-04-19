import 'package:ecommerce_sample/src/features/login/domain/entities/auth_entity.dart';

class AuthModel {
  const AuthModel({
    required this.authToken,
  });

  final String authToken;

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      authToken: map['auth'] as String,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      userToken: authToken,
    );
  }

  @override
  String toString() {
    return 'AuthModel(authToken: $authToken)';
  }
}
