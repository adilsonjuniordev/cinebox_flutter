// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'c59f4bcd2116100bf3114018981490d653b4f6e8';

@ProviderFor(tmbdRepository)
final tmbdRepositoryProvider = TmbdRepositoryProvider._();

final class TmbdRepositoryProvider
    extends $FunctionalProvider<TmdbRepository, TmdbRepository, TmdbRepository>
    with $Provider<TmdbRepository> {
  TmbdRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmbdRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmbdRepositoryHash();

  @$internal
  @override
  $ProviderElement<TmdbRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbRepository create(Ref ref) {
    return tmbdRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbRepository>(value),
    );
  }
}

String _$tmbdRepositoryHash() => r'2eb8ffd5cc655cecad65b028380a41c35dde5a16';
