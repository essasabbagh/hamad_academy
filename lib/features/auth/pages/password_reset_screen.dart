import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/logo.dart';
import 'package:hamad/components/main/main_appbar.dart';
import 'package:hamad/components/submit_button.dart';
import 'package:hamad/core/functions/validators.dart';
import 'package:hamad/core/locale/generated/l10n.dart';

import '../providers/reset_password_provider.dart';

class PasswordResetScreen extends ConsumerWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetPasswordState = ref.watch(resetPasswordProvider);
    final resetPasswordNotifier = ref.read(resetPasswordProvider.notifier);

    return Scaffold(
      appBar: LiteAppBar(title: S.of(context).passwordReset),

      body: Form(
        key: resetPasswordState.formKey,
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
                S.of(context).passwordReset,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).resetPasswordInstructions,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Email Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  enableSuggestions: true,
                  focusNode: resetPasswordState.emailFocusNode,
                  controller: resetPasswordState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.send,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      resetPasswordNotifier.resetPassword(),
                  decoration: InputDecoration(
                    hintText: S.of(context).enterYourEmail,
                    // labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SubmitButton(
                text: S.of(context).submit,
                onPressed: resetPasswordNotifier.resetPassword,
                isLoading: resetPasswordNotifier.isLoading,
              ),
              // Submit Button
            ],
          ),
        ),
      ),
    );
  }
}
