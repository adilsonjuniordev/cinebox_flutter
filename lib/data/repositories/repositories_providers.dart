import 'package:cinebox_flutter/data/services/services_provider.dart';
import 'package:cinebox_flutter/data/repositories/auth/auth_repository.dart';
import 'package:cinebox_flutter/data/repositories/auth/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@Riverpod()
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSignInService: ref.read(googleSignInServiceProvider),
    authService: ref.read(authServiceProvider),
  );
}
