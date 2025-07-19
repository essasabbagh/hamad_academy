import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/app_divider.dart';
import 'package:hamad/components/main/logo.dart';
import 'package:hamad/components/main/main_appbar.dart';
import 'package:hamad/components/submit_button.dart';
import 'package:hamad/core/functions/validators.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/features/settings/widgets/locale_menu.dart';

import '../providers/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      appBar: LiteAppBar(
        title: S.of(context).signIn,
        actions: [
          Container(
            width: 200,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: const LocaleDropdown(),
          ),
        ],
      ),
      body: Form(
        key: loginState.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              const Logo(
                width: 300,
              ),
              const SizedBox(height: 24),
              Text(
                S.of(context).welcomeBack,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              // Email Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  enableSuggestions: true,
                  focusNode: loginState.emailFocusNode,
                  controller: loginState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      loginState.passwordFocusNode.requestFocus(),
                  decoration: InputDecoration(
                    hintText: S.of(context).enterYourEmail,
                    // labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  controller: loginState.passwordController,
                  focusNode: loginState.passwordFocusNode,
                  textInputAction: TextInputAction.send,
                  obscureText: !loginState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) => loginNotifier.login(),
                  decoration: InputDecoration(
                    hintText: S.of(context).enterYourPassword,
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginState.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: loginNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () =>
                      context.goNamed(AppRoutes.resetPassword.name),
                  child: Text(S.of(context).didForgetYourPassword),
                ),
              ),
              const SizedBox(height: 16),

              // Submit Button
              SubmitButton(
                text: S.of(context).login,
                onPressed: loginNotifier.login,
                isLoading: loginNotifier.isLoading,
              ),
              const SizedBox(height: 16),
              const AppDivider(),
              TextButton(
                onPressed: () => context.goNamed(AppRoutes.register.name),
                child: Text(S.of(context).youDontHaveAccount),
              ),
              // const SizedBox(height: 24),
              // TextButton(
              //   onPressed: () => context.goNamed(AppRoutes.settings.name),
              //   child: Text(S.of(context).backToHome),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
