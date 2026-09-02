// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteMovieCommand)
final favoriteMovieCommandProvider = FavoriteMovieCommandFamily._();

final class FavoriteMovieCommandProvider
    extends $NotifierProvider<FavoriteMovieCommand, bool> {
  FavoriteMovieCommandProvider._({
    required FavoriteMovieCommandFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'favoriteMovieCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favoriteMovieCommandHash();

  @override
  String toString() {
    return r'favoriteMovieCommandProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FavoriteMovieCommand create() => FavoriteMovieCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteMovieCommandProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favoriteMovieCommandHash() =>
    r'840f619fa6a5221929b46ddcd5ce7414fa328ef0';

final class FavoriteMovieCommandFamily extends $Family
    with $ClassFamilyOverride<FavoriteMovieCommand, bool, bool, bool, int> {
  FavoriteMovieCommandFamily._()
    : super(
        retry: null,
        name: r'favoriteMovieCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FavoriteMovieCommandProvider call(int movieId) =>
      FavoriteMovieCommandProvider._(argument: movieId, from: this);

  @override
  String toString() => r'favoriteMovieCommandProvider';
}

abstract class _$FavoriteMovieCommand extends $Notifier<bool> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  bool build(int movieId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
