import 'package:dio/dio.dart';

import 'package:hamad/core/client/client.dart';
import 'package:hamad/core/errors/error_handler.dart';
import 'package:hamad/features/auth/requests/login_request.dart';

import '../models/auth_model.dart';

class AuthService {
  AuthService(this.client);

  final ApiClient client;

  Future<AuthModel> login(LoginRequest val) async {
    try {
      final data = FormData.fromMap(val.toJson());

      final res = await client.post(
        '/login',
        data: data,
      );

      return AuthModel.fromJson(res.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> logout() async {
    try {
      final res = await client.post('/logout');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthModel> refreshToken() async {
    try {
      final res = await client.post('/refreshToken');
      return AuthModel.fromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  // changePassword
  Future<void> changePassword(
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final data = FormData.fromMap({
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      final res = await client.post(
        '/changePassword',
        data: data,
      );
      return res.data;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<UserData> profile() async {
    try {
      final res = await client.get('/profile');
      return UserData.fromJson(res.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
