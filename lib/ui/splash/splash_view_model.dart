import 'package:cinebox_flutter/ui/splash/commands/check_user_logged_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

class SplashViewModel {
  final CheckUserLoggedCommand _checkUserLoggedCommand;

  SplashViewModel({required this._checkUserLoggedCommand});

  void checkLoginAndRedirect() => _checkUserLoggedCommand.execute();
}

@Riverpod()
SplashViewModel splashViewModel(Ref ref) {
  return SplashViewModel(
    checkUserLoggedCommand: ref.read(checkUserLoggedCommandProvider.notifier),
  );
}
