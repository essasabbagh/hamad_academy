import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'package:hamad/core/data/secure_storage_service.dart';
import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/services/file_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

GetIt locator = GetIt.instance;

Future<void> initializeApp() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar and navigation bar appearance
  SystemChrome.setSystemUIOverlayStyle(
    // SystemUiOverlayStyle.light.copyWith(
    //   // statusBarColor: AppColor.white,
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ),
    SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,

        systemNavigationBarColor: AppColors.surfaceColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
      ),
  );

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Allow reassignment of values in the locator
  locator.allowReassignment = true;

  locator.registerSingleton<FileService>(FileService());

  await locator.get<FileService>().init();

  // Initialize GetStorage for local storage
  final storage = GetStorage(
    'AppStorage',
    locator<FileService>().supportPath,
  );

  await storage.initStorage;

  // Register GetStorage as a singleton in the service locator
  locator.registerSingleton<GetStorage>(storage);

  // Register StorageService as a lazy singleton in the service locator
  // The StorageService depends on the GetStorage instance
  locator.registerLazySingleton<StorageService>(() => StorageService(storage));

  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  /// Initializes the FlutterSecureStorage instance and registers the
  /// SecureStorageService as a lazy singleton in the service locator.
  ///
  /// The SecureStorageService depends on the FlutterSecureStorage instance.
  ///
  /// Example usage:
  ///
  /// ```dart
  ///   final secureStorageService = locator<SecureStorageService>();
  ///
  ///   secureStorageService.write(key: 'exampleKey', value: 'exampleValue');
  /// }
  /// ```
  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(secureStorage),
  );
  /* 
  // / Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable or disable Crashlytics collection based on app mode.
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    kReleaseMode,
  );

  // Record Flutter framework errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(
      errorDetails,
      fatal: true, // Mark the error as fatal.
    );
  };

  // Record platform-specific errors (e.g., from plugins, native code).
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true, // Mark the error as fatal.
    );
    return true; // Prevents the app from crashing.
  };

  try {
    await NotificationService.instance.initialize();
  } catch (e) {
    AppLog.error('Firebase Messaging initialize faild:');
    AppLog.error('$e');
  } */
}
