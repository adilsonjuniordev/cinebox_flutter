import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/services/auth/auth_service.dart';
import 'package:cinebox_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox_flutter/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox_flutter/data/exceptions/data_exception.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;
  final AuthService _authService;

  AuthRepositoryImpl({
    required this._localStorageService,
    required this._googleSignInService,
    required this._authService,
  });

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        try {
          await _localStorageService.saveIdToken(value);
          await _authService.auth();
          return successOfUnit();
        } on DioException catch (e, s) {
          log(
            'Erro ao autenticar o usuário com o backend',
            name: 'AuthRepositoryImpl',
            error: e,
            stackTrace: s,
          );
          return Failure(
            DataException(message: 'Erro ao realizar login no backend'),
          );
        }

      case Failure<String>(:final error):
        log(
          'Failed to log-in with Google',
          name: 'AuthRepositoryImpl',
          error: error,
        );
        return Failure(
          DataException(message: 'Erro ao realizar login com o Google'),
        );
    }
  }

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();

    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log(
              'Failed to remove id token from local storage',
              name: 'AuthRepositoryImpl',
              error: removeResult,
            );
            return Failure(error);
        }

      case Failure<Unit>(:final error):
        log(
          'Failed to log-out with Google',
          name: 'AuthRepositoryImpl',
          error: error,
        );
        return Failure(error);
    }
  }
}
