// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$providerRepositoryHash() =>
    r'efa822edbba999d35331f91dc3656ffdd9481e8c';

/// See also [providerRepository].
@ProviderFor(providerRepository)
final providerRepositoryProvider =
    AutoDisposeProvider<LoginRepository>.internal(
  providerRepository,
  name: r'providerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$providerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProviderRepositoryRef = AutoDisposeProviderRef<LoginRepository>;
String _$loginProviderHash() => r'8108b819ad0c80a2b21592b1a2d7bbffb52ed645';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LoginProvider
    extends BuildlessAutoDisposeAsyncNotifier<AuthEntity> {
  late final String user;
  late final String password;

  FutureOr<AuthEntity> build(
    String user,
    String password,
  );
}

/// See also [LoginProvider].
@ProviderFor(LoginProvider)
const loginProviderProvider = LoginProviderFamily();

/// See also [LoginProvider].
class LoginProviderFamily extends Family<AsyncValue<AuthEntity>> {
  /// See also [LoginProvider].
  const LoginProviderFamily();

  /// See also [LoginProvider].
  LoginProviderProvider call(
    String user,
    String password,
  ) {
    return LoginProviderProvider(
      user,
      password,
    );
  }

  @override
  LoginProviderProvider getProviderOverride(
    covariant LoginProviderProvider provider,
  ) {
    return call(
      provider.user,
      provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginProviderProvider';
}

/// See also [LoginProvider].
class LoginProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LoginProvider, AuthEntity> {
  /// See also [LoginProvider].
  LoginProviderProvider(
    String user,
    String password,
  ) : this._internal(
          () => LoginProvider()
            ..user = user
            ..password = password,
          from: loginProviderProvider,
          name: r'loginProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginProviderHash,
          dependencies: LoginProviderFamily._dependencies,
          allTransitiveDependencies:
              LoginProviderFamily._allTransitiveDependencies,
          user: user,
          password: password,
        );

  LoginProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
    required this.password,
  }) : super.internal();

  final String user;
  final String password;

  @override
  FutureOr<AuthEntity> runNotifierBuild(
    covariant LoginProvider notifier,
  ) {
    return notifier.build(
      user,
      password,
    );
  }

  @override
  Override overrideWith(LoginProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginProviderProvider._internal(
        () => create()
          ..user = user
          ..password = password,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LoginProvider, AuthEntity>
      createElement() {
    return _LoginProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProviderProvider &&
        other.user == user &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginProviderRef on AutoDisposeAsyncNotifierProviderRef<AuthEntity> {
  /// The parameter `user` of this provider.
  String get user;

  /// The parameter `password` of this provider.
  String get password;
}

class _LoginProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LoginProvider, AuthEntity>
    with LoginProviderRef {
  _LoginProviderProviderElement(super.provider);

  @override
  String get user => (origin as LoginProviderProvider).user;
  @override
  String get password => (origin as LoginProviderProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
