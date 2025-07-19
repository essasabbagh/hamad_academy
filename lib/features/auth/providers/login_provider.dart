import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/utils/snackbars.dart';

import 'auth_provider.dart';

final loginProvider = ChangeNotifierProvider<LoginNotifier>(LoginNotifier.new);

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this.ref);
  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(
    text: 'user@mail.com', // Optional: pre-fill with an email
  );
  final passwordController = TextEditingController(
    text: 'Password123!', // Optional: pre-fill with a password
  );

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // login
  Future<void> login() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
        setLoading(true);

        // Simulate API call
        await Future.delayed(
          Durations.extralong4,
          () => Future.error('Login Faild!'),
        );

        ref.read(authNotifierProvider.notifier).login();

        // Proceed to the next screen
        AppSnackBar.success('Login successful!');
        emailController.text = '';
        passwordController.text = '';
      }
    } catch (e) {
      AppSnackBar.error(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
