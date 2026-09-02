// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SaveFavoriteMovieCommand)
final saveFavoriteMovieCommandProvider = SaveFavoriteMovieCommandFamily._();

final class SaveFavoriteMovieCommandProvider
    extends $NotifierProvider<SaveFavoriteMovieCommand, AsyncValue<int>> {
  SaveFavoriteMovieCommandProvider._({
    required SaveFavoriteMovieCommandFamily super.from,
    required (Key, int) super.argument,
  }) : super(
         retry: null,
         name: r'saveFavoriteMovieCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveFavoriteMovieCommandHash();

  @override
  String toString() {
    return r'saveFavoriteMovieCommandProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SaveFavoriteMovieCommand create() => SaveFavoriteMovieCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFavoriteMovieCommandProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveFavoriteMovieCommandHash() =>
    r'563dddc0fd5fc8005e47a7ef775e236b63542204';

final class SaveFavoriteMovieCommandFamily extends $Family
    with
        $ClassFamilyOverride<
          SaveFavoriteMovieCommand,
          AsyncValue<int>,
          AsyncValue<int>,
          AsyncValue<int>,
          (Key, int)
        > {
  SaveFavoriteMovieCommandFamily._()
    : super(
        retry: null,
        name: r'saveFavoriteMovieCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SaveFavoriteMovieCommandProvider call(Key key, int movieId) =>
      SaveFavoriteMovieCommandProvider._(argument: (key, movieId), from: this);

  @override
  String toString() => r'saveFavoriteMovieCommandProvider';
}

abstract class _$SaveFavoriteMovieCommand extends $Notifier<AsyncValue<int>> {
  late final _$args = ref.$arg as (Key, int);
  Key get key => _$args.$1;
  int get movieId => _$args.$2;

  AsyncValue<int> build(Key key, int movieId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, AsyncValue<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, AsyncValue<int>>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
