import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/services/services_provider.dart';
import 'package:dio/dio.dart';
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
}
