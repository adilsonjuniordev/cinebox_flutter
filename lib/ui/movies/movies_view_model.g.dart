// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesViewModel)
final moviesViewModelProvider = MoviesViewModelProvider._();

final class MoviesViewModelProvider
    extends $NotifierProvider<MoviesViewModel, MoviesViewEnum> {
  MoviesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesViewModelHash();

  @$internal
  @override
  MoviesViewModel create() => MoviesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesViewEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesViewEnum>(value),
    );
  }
}

String _$moviesViewModelHash() => r'94b73473d656114f55cf7dbefe4fea6f3e590548';

abstract class _$MoviesViewModel extends $Notifier<MoviesViewEnum> {
  MoviesViewEnum build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MoviesViewEnum, MoviesViewEnum>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MoviesViewEnum, MoviesViewEnum>,
              MoviesViewEnum,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
