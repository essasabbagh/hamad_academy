import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/extensions/extensions.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/themes/app_themes.dart';
import 'package:hamad/features/settings/providers/locale_provider.dart';
import 'package:hamad/features/settings/providers/theme_notifier.dart';
import 'package:hamad/initialize_app.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    // final themeMode = ref.watch(themeProvider);

    // final storage = locator<StorageService>();
    // storage.remove(onboardingKey);

    return MaterialApp.router(
      onGenerateTitle: (context) => S.of(context).appName,
      debugShowCheckedModeBanner: kDebugMode,
      scaffoldMessengerKey: scaffoldKey,
      routerConfig: router,
      themeMode: ThemeMode.light,
      // themeMode: themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeAnimationCurve: Curves.easeInOut,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      builder: (context, child) {
        return MediaQuery(
          // Replace the textScaler with the calculated scale.
          data: context.mediaQuery.copyWith(
            textScaler: context.clampTextScaler,
          ),
          child: child!,
        );
      },
    );
  }
}
