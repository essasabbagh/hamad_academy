import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/client/client.dart';
import 'package:hamad/core/data/secure_storage_service.dart';
import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/features/auth/models/auth_model.dart';
import 'package:hamad/features/auth/services/auth_service.dart';
import 'package:hamad/initialize_app.dart';

final storageService = locator<StorageService>();
final secureStorageService = locator<SecureStorageService>();

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.read(apiClientProvider)),
);

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, bool>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<bool> {
  UserData? user;

  @override
  FutureOr<bool> build() async {
    // TODO : Implement a more robust authentication check
    return Future.delayed(Durations.extralong4, () => true);
    // return true;
    // try {
    //   final res = await ref.read(authServiceProvider).profile();
    //   user = res;
    //   return res.id != null;
    // } catch (e) {
    //   return false;
    // }
  }

  Future<void> login() async {
    // final res = await ref.read(authServiceProvider).profile();
    // user = res;
    state = const AsyncValue.data(true);
  }

  Future<void> logout() async {
    user = null;

    Future.wait([
      storageService.remove(localUserKey),
      secureStorageService.remove(tokenKey),
    ]);

    state = const AsyncValue.data(false);
  }
}
