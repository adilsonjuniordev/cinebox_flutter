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

@ProviderFor(tmdbRepository)
final tmdbRepositoryProvider = TmdbRepositoryProvider._();

final class TmdbRepositoryProvider
    extends $FunctionalProvider<TmdbRepository, TmdbRepository, TmdbRepository>
    with $Provider<TmdbRepository> {
  TmdbRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbRepositoryHash();

  @$internal
  @override
  $ProviderElement<TmdbRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbRepository create(Ref ref) {
    return tmdbRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbRepository>(value),
    );
  }
}

String _$tmdbRepositoryHash() => r'ba312a23bb145753431fddc7d923d6c8f6af9d87';

@ProviderFor(moviesRepository)
final moviesRepositoryProvider = MoviesRepositoryProvider._();

final class MoviesRepositoryProvider
    extends
        $FunctionalProvider<
          MoviesRepository,
          MoviesRepository,
          MoviesRepository
        >
    with $Provider<MoviesRepository> {
  MoviesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesRepositoryHash();

  @$internal
  @override
  $ProviderElement<MoviesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoviesRepository create(Ref ref) {
    return moviesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesRepository>(value),
    );
  }
}

String _$moviesRepositoryHash() => r'e999c9cf4936edff3e71184b3a48aa29acebf4c0';
