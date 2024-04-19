import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.userToken,
  });

  final String userToken;

  AuthEntity copyWith({
    String? userToken,
  }) {
    return AuthEntity(
      userToken: userToken ?? this.userToken,
    );
  }

  @override
  List<Object?> get props => [
        userToken,
      ];
}
