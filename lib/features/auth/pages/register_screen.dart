import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/app_divider.dart';
import 'package:hamad/components/main/logo.dart';
import 'package:hamad/components/main/main_appbar.dart';
import 'package:hamad/components/submit_button.dart';
import 'package:hamad/configs/app_configs.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/functions/validators.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/utils/url_luncher.dart';
import 'package:hamad/features/settings/widgets/locale_menu.dart';

import '../providers/auth_provider.dart';
import '../providers/register_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    final registerNotifier = ref.read(registerProvider.notifier);

    return Scaffold(
      appBar: LiteAppBar(
        title: S.of(context).signUp,
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
        key: registerState.formKey,
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
                S.of(context).welcomeToApp(AppConfigs.appName),
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
                  focusNode: registerState.emailFocusNode,
                  controller: registerState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      registerState.passwordFocusNode.requestFocus(),
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
                  controller: registerState.passwordController,
                  focusNode: registerState.passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  obscureText: !registerState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      registerState.confirmPasswordFocusNode.requestFocus(),
                  decoration: InputDecoration(
                    hintText: S.of(context).enterYourPassword,
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        registerState.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: registerNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input
              // TODO - Add a password strength indicator
              SizedBox(
                height: 65,
                child: TextFormField(
                  controller: registerState.confirmPasswordController,
                  focusNode: registerState.confirmPasswordFocusNode,
                  textInputAction: TextInputAction.send,
                  obscureText: !registerState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) => confirmPasswordValidator(
                    val,
                    registerState.passwordController.text,
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) => registerNotifier.register(),
                  decoration: InputDecoration(
                    hintText: S.of(context).enterYourPassword,
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        registerState.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: registerNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Terms and Conditions
              Row(
                children: [
                  Transform.scale(
                    scale: 1.1,
                    child: Checkbox(
                      splashRadius: 16,
                      checkColor: AppColors.white,
                      activeColor: AppColors.primary500,
                      value: registerState.isChecked,
                      onChanged: registerNotifier.toggleTermsAndConditions,
                      side: const BorderSide(
                        color: AppColors.neutral700,
                        width: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      style: const TextStyle(fontSize: 14, height: 1.8),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).byRegisteringYouAgreeToOur,
                          ),
                          TextSpan(
                            text: S.of(context).termsOfService,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  openUrl(AppConfigs.termsOfServiceUrl),
                          ),
                          TextSpan(text: S.of(context).and),
                          TextSpan(
                            text: S.of(context).privacyPolicy,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  openUrl(AppConfigs.privacyPolicyUrl),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Social Media Login Buttons
              const SizedBox(height: 24),
              // Submit Button
              SubmitButton(
                text: S.of(context).register,
                onPressed: registerNotifier.register,
                isLoading: registerNotifier.isLoading,
              ),
              const SizedBox(height: 16),
              const AppDivider(),
              Center(
                child: TextButton(
                  onPressed: () {
                    ref.invalidate(authNotifierProvider);
                    context.goNamed(AppRoutes.login.name);
                  },
                  child: Text(S.of(context).doYouHaveAnAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
