// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_logged_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckUserLoggedCommand)
final checkUserLoggedCommandProvider = CheckUserLoggedCommandProvider._();

final class CheckUserLoggedCommandProvider
    extends $AsyncNotifierProvider<CheckUserLoggedCommand, bool?> {
  CheckUserLoggedCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkUserLoggedCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkUserLoggedCommandHash();

  @$internal
  @override
  CheckUserLoggedCommand create() => CheckUserLoggedCommand();
}

String _$checkUserLoggedCommandHash() =>
    r'af3b3f783a8246081fb588305a134166a10efc21';

abstract class _$CheckUserLoggedCommand extends $AsyncNotifier<bool?> {
  FutureOr<bool?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool?>, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, bool?>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
