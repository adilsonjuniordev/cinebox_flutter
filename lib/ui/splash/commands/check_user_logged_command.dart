import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@Riverpod()
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  void execute() async {
    state = AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    await Future.delayed(const Duration(seconds: 2));
    final isLogged = await authRepository.isLogged();

    state = switch (isLogged) {
      Success<bool>(value: final isLogged) => AsyncData(isLogged),
      Failure<bool>(error: final error) => AsyncError(
        error,
        StackTrace.current,
      ),
    };
  }
}
