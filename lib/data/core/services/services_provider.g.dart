// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localStorageService)
final localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'6393dfa3b7044bce3761873180d69dc9438297b5';
