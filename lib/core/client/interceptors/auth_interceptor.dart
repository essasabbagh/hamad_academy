import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/data/secure_storage_service.dart';
import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/features/auth/providers/auth_provider.dart';
import 'package:hamad/initialize_app.dart';

final storageService = locator<StorageService>();
final secureStorageService = locator<SecureStorageService>();

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await secureStorageService.read(tokenKey);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await storageService.remove(localUserKey);
      await secureStorageService.remove(tokenKey);
      ProviderScope.containerOf(
        rootNavigatorKey.currentContext!,
      ).read(authNotifierProvider.notifier).logout();
    }

    // If refreshing the token fails or the error is not 401, forward the error
    return handler.next(err);
  }
}
