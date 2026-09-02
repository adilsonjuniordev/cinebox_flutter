import 'dart:developer';

import 'package:cinebox_flutter/cinebox_main_app.dart';
import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/services/services_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackendAuthInterceptor extends Interceptor {
  final Ref ref;

  BackendAuthInterceptor({required this.ref});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final idToken = await localStorage.getIdToken();
    if (idToken case Success(value: final token)) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final DioException(:response) = err;
    if (response?.statusCode == 401) {
      final localStorage = ref.read(localStorageServiceProvider);
      localStorage.removeIdToken();
      Navigator.of(navKey.currentContext!).pushNamedAndRemoveUntil(
        '/login',
        (_) => false,
      );
    }
    handler.reject(err);
  }
}
