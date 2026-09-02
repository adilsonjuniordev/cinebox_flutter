// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetFavoritesCommand)
final getFavoritesCommandProvider = GetFavoritesCommandProvider._();

final class GetFavoritesCommandProvider
    extends
        $NotifierProvider<
          GetFavoritesCommand,
          AsyncValue<List<FavoriteMovie>>
        > {
  GetFavoritesCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoritesCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoritesCommandHash();

  @$internal
  @override
  GetFavoritesCommand create() => GetFavoritesCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<FavoriteMovie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<FavoriteMovie>>>(
        value,
      ),
    );
  }
}

String _$getFavoritesCommandHash() =>
    r'4f42ccabdbc9f5b7d76b199af310b535fb38cbb8';

abstract class _$GetFavoritesCommand
    extends $Notifier<AsyncValue<List<FavoriteMovie>>> {
  AsyncValue<List<FavoriteMovie>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FavoriteMovie>>,
              AsyncValue<List<FavoriteMovie>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FavoriteMovie>>,
                AsyncValue<List<FavoriteMovie>>
              >,
              AsyncValue<List<FavoriteMovie>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
