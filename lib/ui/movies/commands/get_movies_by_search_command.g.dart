// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_search_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesBySearchCommand)
final getMoviesBySearchCommandProvider = GetMoviesBySearchCommandProvider._();

final class GetMoviesBySearchCommandProvider
    extends
        $NotifierProvider<GetMoviesBySearchCommand, AsyncValue<List<Movie>>> {
  GetMoviesBySearchCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesBySearchCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesBySearchCommandHash();

  @$internal
  @override
  GetMoviesBySearchCommand create() => GetMoviesBySearchCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$getMoviesBySearchCommandHash() =>
    r'623f09849c719c6c191f55a7ea52c77476d6509c';

abstract class _$GetMoviesBySearchCommand
    extends $Notifier<AsyncValue<List<Movie>>> {
  AsyncValue<List<Movie>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
