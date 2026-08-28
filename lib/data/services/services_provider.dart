import 'package:cinebox_flutter/data/core/rest_client/backend_rest_client_provider.dart';
import 'package:cinebox_flutter/data/core/rest_client/tmdb_rest_client_provider.dart';
import 'package:cinebox_flutter/data/services/auth/auth_service.dart';
import 'package:cinebox_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox_flutter/data/services/google_sign_in/google_sign_in_service_impl.dart';
import 'package:cinebox_flutter/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox_flutter/data/services/local_storage/local_storage_service_impl.dart';
import 'package:cinebox_flutter/data/services/tmdb/tmdb_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage());
}

@riverpod
GoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInServiceImpl();
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}

@riverpod
TmdbService tmdbSerice(Ref ref) {
  return TmdbService(ref.read(tmdbRestClientProvider));
}
