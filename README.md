# Code Expert Flutter Template

![Logo](./assets/images/logo_full.png)

## Description

A brief overview of your Flutter application, its purpose, and key features.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run](#run)
- [Build](#build)
- [Deployment](#deployment)
- [Features](#features)
- [Usage](#usage)

## Features

Features of Template app:

- [Theme](#theme)
- [Routing](#routing)
- [Client](#client)
- [Multilingual](#multilingual)
- [Utilities](#utilities)
- [Log](#log)
- [Storage](#storage)
- [File Service](#storage)
- [Auth](#auth)

---

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK 3.32.6
- Dart SDK
- FVM - Flutter Version Management
- Android Studio or VS Code with Flutter extensions
- Simulator/Emulator or physical device for testing

### Recommended Versions

- Flutter: 3.32.6
- Dart: [Specify minimum/recommended version]

```bash
fvm use 3.32.6
```

### Recommended VsCode Extensions

[Flutter Riverpod Snippets](https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets)

[Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator)

[Dart Import Sorter](https://marketplace.visualstudio.com/items?itemName=aziznal.dart-import-sorter)

[Flutter Print Tools](https://marketplace.visualstudio.com/items?itemName=marinv.flutter-print-tools)

[Dart Barrel File Generator](https://marketplace.visualstudio.com/items?itemName=miquelddg.dart-barrel-file-generator)

[Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)

[Flutter Applog](https://marketplace.visualstudio.com/items?itemName=essasabbagh.flutter-applog)

---

## Installation

Provide instructions on how to install your app. Include any prerequisites and step-by-step installation guide.

### Clone the Repository

[Github link](https://)

```bash
git clone https://github.com/[your-username]/[your-repo-name].git
cd [your-repo-name]
```
If you haven't already, install the Firebase CLI.
```bash
firebase login
```
```bash
dart pub global activate flutterfire_cli 
```
### Setup Firebase Configs
```bash
flutterfire configure 
```
### Install Dependencies

```bash
flutter pub get
```

### Assets

Use Flutter assets vscode extension
[Flutter assets](https://marketplace.visualstudio.com/items?itemName=weekit.flutter-assets-gen2)

```yaml
flutter_assets:
  assets_path: assets/
  output_path: lib/core/constants/
  filename: images.dart
  classname: AppImages
  ignore_comments: true
  field_prefix:
```

Compress Flutter assets
[squoosh](https://squoosh.app/) -
[tinypng](https://tinypng.com/)

### Run

```bash
flutter run lib/main.dart 
```

### Change app name

- Run this command

```bash
dart run rename_app:main all="Hamad Academy"
```

- lib/configs/app_configs.dart

```dart
static const String appName = 'Hamad Academy';
```

- lib/locale/intl_XX.arb

```json
"appName": "Hamad Academy",
```

### Generates native splash

```bash
dart run flutter_native_splash:create
```

note: to edit configs go to: flutter_native_splash.yaml

## Build

### Build an APK

```bash
sh apk.sh
```

This command results in three APK files:

    build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    build/app/outputs/apk/release/app-arm64-v8a-release.apk
    build/app/outputs/apk/release/app-x86_64-release.apk

### Build an Android Bundle

You can use script to incremet app version and build a new bundle
and hnadle all build details like upload Flutter debug symbols

```bash
sh android.sh
```

The release bundle for your app is created at

    build/app/outputs/bundle/release/app.aab.

### Build an IOS

or to incremet app version and build a new version

```bash
sh ios.sh
```

    build/ios/archive/Runner.xcarchive

Use the Firebase CLI to upload Flutter debug symbols.
You need to upload the debug symbols before reporting a crash from an obfuscated code build.

```bash
firebase crashlytics:symbols:upload --app=1:839865712716:android:d947678144e9e5c22034e9 build/app/intermediates/stripped_native_libs/debug/out/lib

ios/Pods/FirebaseCrashlytics/upload-symbols -gsp ios/GoogleService-Info.plist -p ios build/ios/archive/Runner.xcarchive/dSYMs
```

---

## Deployment

### Deploy to Google play

- Need to create intrenal test
- Then create open test
- Then have to create closed test track
  - Closed test should be created for same version to 20 tester
  - Tester shouldnot be shared with internal tester list

### Deploy to Apple

---

# Usage

## Theme

lib/core/themes

```dart
color: Theme.of(context).shadowColor
color: Theme.of(context).colorScheme.onSurface
style: Theme.of(context).textTheme.bodyMedium
style: Theme.of(context).textTheme.bodyLarge
```

### Fonts

- Font Family: notoSansArabic Using Google font

```dart
class AppConfigs {
    ...
  // font family
  static const String fontFamily = 'Poppins';
}

class AppFont {
  static const String fontFamily = AppConfigs.fontFamily;
}
```

### Gradient

```dart
class AppGradient {
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF069ACC),
      Color(0xFF0594C6),
      Color(0xFF0483B6),
      Color(0xFF02679B),
      Color(0xFF004177),
      Color(0xFF003B71),
    ],
    stops: [
      0.1079,
      0.2481,
      0.446,
      0.6603,
      0.8995,
      0.9325,
    ],
  );
}
```

### Color Reference

| Color           | Hex                                                              |
| --------------- | ---------------------------------------------------------------- |
| Primary Color   | ![#007EA8](https://via.placeholder.com/10/007EA8?text=+) #007EA8 |
| Primary 50      | ![#EEF7FF](https://via.placeholder.com/10/EEF7FF?text=+) #EEF7FF |
| Primary 200     | ![#92CAFF](https://via.placeholder.com/10/92CAFF?text=+) #92CAFF |
| Primary 500     | ![#4FA1ED](https://via.placeholder.com/10/4FA1ED?text=+) #4FA1ED |
| Primary 700     | ![#11599C](https://via.placeholder.com/10/11599C?text=+) #11599C |
| Primary 900     | ![#003C73](https://via.placeholder.com/10/003C73?text=+) #003C73 |
| Secondary Color | ![#B0E7F9](https://via.placeholder.com/10/B0E7F9?text=+) #B0E7F9 |
| Secondary 50    | ![#E5F8FF](https://via.placeholder.com/10/E5F8FF?text=+) #E5F8FF |
| Secondary 200   | ![#5CD6FF](https://via.placeholder.com/10/5CD6FF?text=+) #5CD6FF |
| Secondary 500   | ![#00B2ED](https://via.placeholder.com/10/00B2ED?text=+) #00B2ED |
| Secondary 700   | ![#00759B](https://via.placeholder.com/10/00759B?text=+) #00759B |
| Secondary 900   | ![#005673](https://via.placeholder.com/10/005673?text=+) #005673 |
| Gray 50         | ![#F9FAFB](https://via.placeholder.com/10/F9FAFB?text=+) #F9FAFB |
| Gray 100        | ![#F3F4F6](https://via.placeholder.com/10/F3F4F6?text=+) #F3F4F6 |
| Gray 200        | ![#E5E7EB](https://via.placeholder.com/10/E5E7EB?text=+) #E5E7EB |
| Gray 300        | ![#D1D5DB](https://via.placeholder.com/10/D1D5DB?text=+) #D1D5DB |
| Gray 400        | ![#9CA3AF](https://via.placeholder.com/10/9CA3AF?text=+) #9CA3AF |
| Gray 500        | ![#687280](https://via.placeholder.com/10/687280?text=+) #687280 |
| Gray 600        | ![#485563](https://via.placeholder.com/10/485563?text=+) #485563 |
| Gray 700        | ![#374151](https://via.placeholder.com/10/374151?text=+) #374151 |
| Gray 800        | ![#1F2937](https://via.placeholder.com/10/1F2937?text=+) #1F2937 |
| Gray 900        | ![#111827](https://via.placeholder.com/10/111827?text=+) #111827 |
| Light Primary   | ![#E6F7FD](https://via.placeholder.com/10/E6F7FD?text=+) #E6F7FD |
| Accent Color    | ![#FF9800](https://via.placeholder.com/10/FF9800?text=+) #FF9800 |
| Light Color     | ![#E6ECF1](https://via.placeholder.com/10/E6ECF1?text=+) #E6ECF1 |
| White           | ![#FFFFFF](https://via.placeholder.com/10/FFFFFF?text=+) #FFFFFF |
| Text Primary    | ![#001930](https://via.placeholder.com/10/001930?text=+) #001930 |
| Text Secondary  | ![#003769](https://via.placeholder.com/10/003769?text=+) #003769 |
| Hint Color      | ![#8AA5BF](https://via.placeholder.com/10/8AA5BF?text=+) #8AA5BF |
| Border Color    | ![#D1D5DB](https://via.placeholder.com/10/D1D5DB?text=+) #D1D5DB |
| Primary Dark    | ![#004080](https://via.placeholder.com/10/004080?text=+) #004080 |
| Primary Light   | ![#80BFFF](https://via.placeholder.com/10/80BFFF?text=+) #80BFFF |
| Success 600     | ![#039855](https://via.placeholder.com/10/039855?text=+) #039855 |
| Success 100     | ![#D1FADF](https://via.placeholder.com/10/D1FADF?text=+) #D1FADF |
| Success 50      | ![#ECFDF3](https://via.placeholder.com/10/ECFDF3?text=+) #ECFDF3 |
| Error 600       | ![#E53935](https://via.placeholder.com/10/E53935?text=+) #E53935 |

---

## Routing

Libraries & Tools Used

- [go_router](https://pub.dev/packages/go_router)

lib/core/router

Redirection changes the location to a new one based on auth state.

```dart
final routerProvider
```

To navigate to a route using its name, call **goNamed()**:

```dart
 // example
context.goNamed(
  AppRouters.checkEmail.name,
  pathParameters: {
    "email": _emailnameController.text,
  },
);
```

To configure a named route, use the name parameter:

```dart
GoRoute(
  path: AppRoutes.splash.path,
  name: AppRoutes.splash.name,
  builder: (_, __) => const SplashScreen(),
),
```

lib\configs\routes\app_router.dart

```dart
enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  ...
}
```

---

## Client

The `ApiClient` is a robust, singleton network service utility built with Dio, providing a centralized and configurable approach to making HTTP network requests in the application.

### Features

- Centralized HTTP request management
- Dio-based network service
- Configurable base options
- Debug logging
- Flexible request methods
- Timeout and cancellation support

### Providers

```dart
// Dio Provider
final dioProvider = Provider((ref) => Dio());

// Network Service Provider
final networkServiceProvider = Provider((ref) => ApiClient());
```

### Configuration

#### Base Options

- **Base URL**: Configured from `AppConfigs.baseUrl`
- **Timeout Duration**: Consistent across receive, connect, and send operations
- **Response Type**: JSON
- **Content Type**: Application JSON
- **Headers**:
  - `Accept: application/json`

### Request Methods

#### GET Request

```dart
Future get(
  String path, {
  Map? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onReceiveProgress,
})
```

#### POST Request

```dart
Future post(
  String path, {
  dynamic data,
  Map? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
})
```

### Interceptors

- **Pretty Dio Logger**:
  - Enabled only in debug mode
  - Logs request/response headers and bodies
  - Configurable logging verbosity

### Usage Examples

#### Basic GET Request

```dart
final apiClient = ApiClient();
try {
  final response = await apiClient.get('/users');
  // Process response
} catch (e) {
  // Handle error
}
```

#### POST Request with Data

```dart
final data = {'username': 'example', 'password': 'password'};
final response = await apiClient.post(
  '/login', 
  data: data,
  options: Options(headers: {'Custom-Header': 'value'})
);
```

### Advanced Features

- **Cancel Requests**: Use `CancelToken` to abort ongoing requests
- **Progress Tracking**: Monitor upload/download progress
- **Custom Headers**: Easily add custom headers to requests

### Best Practices

- Always handle potential network exceptions
- Use `try-catch` for error management
- Implement proper error handling and user feedback
- Consider network connectivity before making requests
- Use cancellation tokens for long-running or unnecessary requests

### Error Handling

```dart
try {
  final response = await apiClient.get('/endpoint');
} on DioException catch (e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      // Handle connection timeout
      break;
    case DioExceptionType.receiveTimeout:
      // Handle receive timeout
      break;
    case DioExceptionType.sendTimeout:
      // Handle send timeout
      break;
    case DioExceptionType.badResponse:
      // Handle bad response
      break;
    default:
      // Handle other errors
  }
}
```

### Performance Considerations

- Minimal overhead with singleton pattern
- Efficient request management
- Configurable logging for debugging
- Low memory footprint

### Recommended Packages

- `dio`: Core HTTP networking
- `pretty_dio_logger`: Debugging and logging
- `dio_cache_interceptor`: Optional request caching

### Future Improvements

- Implement comprehensive authentication interceptor
- Add more robust error handling
- Support for request/response encryption
- Advanced caching mechanisms

---

## Network Connectivity Utility

The Network Info utility provides a robust and abstracted way to monitor and check network connectivity within the application using the `connectivity_plus` package and Riverpod state management.

### Features

- Centralized network connectivity management
- Multiple network type detection
- Easy-to-use connectivity checking
- Riverpod provider integration
- Comprehensive connectivity status reporting

### Connectivity Providers

#### Connectivity Provider

```dart
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});
```

#### Network Info Provider

```dart
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.read(connectivityProvider));
});
```

### Connectivity Status

The utility supports multiple network connectivity states:

- **Connected**: Device is connected to a network
- **Disconnected**: No network connection available
- **Not Determined**: Unable to determine network state

### Supported Network Types

- Mobile Network
- Wi-Fi
- Ethernet
- VPN
- Bluetooth
- Other network types

### Usage Examples

#### Checking Network Connectivity

```dart
// Create an instance of NetworkInfo
final networkInfo = NetworkInfo(Connectivity());

// Check if device is connected
bool isConnected = await networkInfo.isConnected;

// Get detailed connectivity status
ConnectivityStatus status = await networkInfo.checkConnectivity();
```

#### Using with Riverpod

```dart
// In a Riverpod widget or provider
final networkInfo = ref.watch(networkInfoProvider);
final isConnected = await networkInfo.isConnected;
```

### Best Practices

- Use network connectivity checks before network-dependent operations
- Handle different connectivity scenarios gracefully
- Provide user-friendly feedback during connectivity changes
- Consider implementing a connectivity listener for real-time updates

### Potential Use Cases

- Prevent network requests when offline
- Show/hide content based on connectivity
- Implement offline mode
- Retry failed network operations
- Display network status indicators

### Error Handling

- Always handle potential connectivity exceptions
- Provide fallback mechanisms for network-dependent features
- Inform users about connection issues

### Platform Considerations

- Different behavior on iOS, Android, and other platforms
- VPN detection might vary across platforms
- Wi-Fi and mobile network detection may have nuances

### Performance Notes

- Lightweight and efficient connectivity checking
- Minimal overhead in network status detection
- Quick response time for connectivity queries

### Recommended Packages

- `connectivity_plus`: Core connectivity detection
- `riverpod`: State management integration

---

## Multilingual

```yaml
flutter_localizations:
  sdk: flutter
intl: ^0.18.1
intl_utils: ^2.8.5
```

### Add ARB files

Add the following vscode Extension
  [flutter-intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

  [Fix my ARB](https://marketplace.visualstudio.com/items?itemName=coodooGmbH.fixmyarb)

To generate boilerplate code for localization, run the generate program inside directory where your pubspec.yaml file is located:

<https://www.linkedin.com/posts/shehab-mohamed-_%D9%81%D9%89-%D8%B7%D8%B1%D9%82-%D9%83%D8%AA%D9%8A%D8%B1-%D9%81-%D9%81%D9%84%D8%A7%D8%AA%D8%B1-%D8%A7%D9%86%D9%83-%D8%AA%D8%B9%D9%85%D9%84-localizations-activity-7253578654897606656--CFQ/?utm_source=share&utm_medium=member_desktop>

Create Local Provider

```dart
const defaultLocale = Locale('ar', '');
const languageCodeKey = 'languageCode';

final storageService = locator<StorageService>();

final localProvider = StateNotifierProvider<LocalProvider, Locale>(
  (_) {
    final languageCode = storageService.read(languageCodeKey);
    return LocalProvider(
      languageCode.isEmpty ? defaultLocale.languageCode : languageCode,
    );
  },
);

class LocalProvider extends StateNotifier<Locale> {
  LocalProvider(String languageCode) : super(Locale(languageCode));

  void changeLocale(Locale? locale) {
    state = locale ?? defaultLocale;
    storageService.write(languageCodeKey, state.languageCode);
  }

  final supportedLocales = const [
    Locale('en'), 
    Locale('ar'), 
  ];
}
```

To change loacal use LocaleChanger widget

```dart
class LocaleChanger extends ConsumerWidget {
  const LocaleChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localProvider);
    final localeNotifier = ref.read(localProvider.notifier);

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            S.of(context).applanguage,
            style: body14,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<Locale>(
          value: locale,
          onChanged: localeNotifier.changeLocale,
          items: localeNotifier.supportedLocales.map((val) {
            final lang =
                languages.firstWhere((e) => e['code'] == val.languageCode);
            return DropdownMenuItem(
              value: val,
              child: Row(
                children: <Widget>[
                  Text(lang['flag']),
                  const SizedBox(width: 8.0),
                  Text(lang['name']),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
```

To use translation

```dart
Text(
    S.of(context).welcomeBack,
)
```

---

## Auth

Libraries & Tools Used:

- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)

To get auth state, fetch data using AuthService
lib\services\network\auth_service.dart

```dart
class AuthService {
  final DioClient client;

  AuthService(this.client);

  Future<AuthModel> login(String username, String password) async {
    final formData = FormData.fromMap({
      'email_or_username': username,
      'password': password,
    });

    final res = await client.post(
      loginPath,
      data: formData,
    );

    return AuthModel.fromJson(res.data);
  }

  Future<AuthModel> register(RegisterParam param) async {
    final formData = FormData.fromMap(param.toJson());

    final res = await client.post(
      registerPath,
      data: formData,
    );

    return AuthModel.fromJson(res.data);
  }

  Future<void> logout() async {
    final res = await client.post(logoutPath);
  }

  Future<MeModel> getUserInfo() async {
    final res = await client.post(mePath);
    return MeModel.fromJson(res.data);
  }
}
```

To get current state use ConsumerWidget with AuthProvider

```dart
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          auth.isLoggedIn ?? false
              ? GestureDetector(
                  onTap: () {
                    context.pop();
                    context.goNamed(AppRouter.profile);
                  },
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auth.user?.name ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          auth.user?.email ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                // not logged
              : const DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Logo(
                      width: 60,
                    ),
                  ),
                ),
         ...
        ],
      ),
    );
  }
}
```

---

## Log

The application uses a custom `AppLog` utility for structured, colorful, and configurable logging across different environments.

### Features

- Multiple log levels: Success, Info, Warning, Debug, Error
- Color-coded console output
- Configurable log levels
- Metadata support
- Release mode logging control

### Log Levels

- **Success** (🟢): Indicates successful operations
- **Info** (🔵): General informational messages
- **Warning** (🟠): Potential issues or important notifications
- **Debug** (⚪️): Detailed debugging information
- **Error** (🚫): Error and critical issue logs

### Usage Examples

```dart
// Basic logging
AppLog.success('Operation completed successfully');
AppLog.info('Application started', 'Startup');
AppLog.warning('Low disk space', 'Storage');
AppLog.debug('Fetching user data');
AppLog.error('Failed to load user profile', 'Authentication', 
    metadata: {'userId': 123});

// Configuring log level
AppLog.setLogLevel(LogLevel.warning); // Only show warnings and errors
```

### Best Practices

- Use appropriate log levels
- Include meaningful tags
- Add metadata for complex error tracking
- Avoid logging sensitive information

### Configuration Options

#### Setting Log Level

Control which log levels are displayed:

```dart
// Only show warnings and errors
AppLog.setLogLevel(LogLevel.warning);
```

#### Release Mode Logging

By default, logs are disabled in release mode. To enable:

```dart
AppLog.enableReleaseLogging = true;
```

#### Customizing Log Styles

You can customize the appearance of log levels:

```dart
AppLog.setLogStyle(LogLevel.success, 
  LogStyle(colorCode: '35', emoji: '🌟')
);
```

---

## Utilities

## SnackBar

The SnackBar utility provides a convenient and consistent way to display temporary notifications across the application. It supports different types of notifications with color-coded backgrounds and integrates with the app's logging system.

#### Features

- Multiple SnackBar types: Success, Error, Warning, Info
- Consistent styling
- Automatic logging of messages
- Customizable actions
- Floating behavior

### Usage Examples

```dart
// Success Notification
AppSnackBar.showSuccess('Operation completed successfully');

// Error Notification
AppSnackBar.showError('Something went wrong');

// Warning Notification
showWarningSnackbar('Proceed with caution');

// Info Notification
showInfoSnackbar('Additional information');
```

#### SnackBar with Custom Action

```dart
AppSnackBar.showSuccess(
  'Saved successfully', 
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Undo action logic
    }
  )
);
```

### SnackBar Types

- **Success SnackBar** (Green): Positive outcomes and successful operations
- **Error SnackBar** (Red): Error messages and critical notifications
- **Warning SnackBar** (Amber): Cautionary or important messages
- **Info SnackBar** (Blue): Informational messages and updates

### Important Notes

- Requires a global `scaffoldKey` to be set up in your app
- Automatically logs messages using `AppLog`
- Default action is to dismiss the SnackBar
- Only one SnackBar is shown at a time

### Best Practices

- Use appropriate SnackBar type based on the message context
- Keep messages concise and clear
- Use SnackBars for temporary, non-blocking notifications
- Avoid overusing SnackBars to prevent user fatigue

---

## Custom Alert Dialog

The `CustomAlertDialog` is a flexible and visually appealing alert dialog component that supports multiple dialog types with dynamic styling and behavior.

### Features

- Four distinct dialog types: Error, Warning, Info, Success
- Dynamic icon and color based on dialog type
- Customizable title, description, and button texts
- Centered layout with rounded design
- Themed typography
- Callback support for accept action

### Dialog Types

1. **Error Dialog** (Red)
   - Used for critical or destructive actions
   - Error-related confirmations

2. **Warning Dialog** (Orange)
   - Cautions about potential consequences
   - Actions requiring careful consideration

3. **Info Dialog** (Primary Color)
   - Informational messages
   - Neutral notifications

4. **Success Dialog** (Green)
   - Positive confirmations
   - Celebration or completion messages

### Usage Examples

#### Basic Alert Dialog

```dart
await showDialog<bool>(
  context: context,
  builder: (ctx) => CustomAlertDialog(
    title: 'Delete Account',
    description: 'Are you sure you want to delete your account?',
    acceptText: 'Delete',
    cancelText: 'Cancel',
    type: AlertDialogType.error,
    onAccept: () {
      // Perform deletion logic
    },
  ),
);
```

#### Different Dialog Types

```dart
// Warning Dialog
CustomAlertDialog(
  title: 'Unsaved Changes',
  description: 'You have unsaved changes. Proceed?',
  type: AlertDialogType.warning,
  // ...
)

// Info Dialog
CustomAlertDialog(
  title: 'Update Available',
  description: 'A new version of the app is ready.',
  type: AlertDialogType.info,
  // ...
)

// Success Dialog
CustomAlertDialog(
  title: 'Profile Updated',
  description: 'Your profile has been successfully updated.',
  type: AlertDialogType.success,
  // ...
)
```

### Customization

- Fully customizable text for title, description, and buttons
- Supports custom accept action callback
- Inherits theme styling for consistent design

### Best Practices

- Use appropriate dialog type based on context
- Keep titles and descriptions concise
- Provide clear and specific actions
- Use dialogs for important confirmations or information
- Avoid overusing dialogs to prevent user frustration

### Accessibility Considerations

- Centered layout for better visibility
- Large, clear icons
- High-contrast color scheme
- Readable typography

---

## Date Helper Utility

The `DateHelper` class provides a human-readable, localized representation of time elapsed since a given date. It converts raw datetime differences into friendly, easy-to-read time phrases.

### Features

- Supports multiple time granularities:
  - Just now
  - Seconds
  - Minutes
  - Hours
  - Days
  - Weeks
  - Months
  - Years
- Fully localized time representations
- Simple, static method for easy usage

### Supported Time Ranges

| Range       | Output Format   |
| ----------- | --------------- |
| < 5 seconds | "Just now"      |
| < 1 minute  | "X seconds ago" |
| < 1 hour    | "X minutes ago" |
| < 24 hours  | "X hours ago"   |
| < 7 days    | "X days ago"    |
| < 30 days   | "X weeks ago"   |
| < 365 days  | "X months ago"  |
| 1 year+     | "X years ago"   |

### Usage Examples

```dart
// Basic usage
DateTime pastDate = DateTime.now().subtract(Duration(hours: 3));
String readableTime = DateHelper.timeAgo(pastDate);
print(readableTime); // "3 hours ago"

// Different time ranges
DateTime justNow = DateTime.now().subtract(Duration(seconds: 3));
DateTime fewMinutesAgo = DateTime.now().subtract(Duration(minutes: 5));
DateTime yesterdayDate = DateTime.now().subtract(Duration(days: 1));
DateTime oldDate = DateTime.now().subtract(Duration(days: 365));

print(DateHelper.timeAgo(justNow));     // "Just now"
print(DateHelper.timeAgo(fewMinutesAgo)); // "5 minutes ago"
print(DateHelper.timeAgo(yesterdayDate)); // "1 day ago"
print(DateHelper.timeAgo(oldDate));       // "1 year ago"
```

### Localization

- Uses `S.current` for language-specific time representations
- Supports multiple languages through generated localization files
- Automatic translation of time phrases

### Best Practices

- Use for displaying relative timestamps
- Ideal for social media feeds, chat logs, and activity streams
- Provides more user-friendly experience than raw datetime
- Lightweight and performant

### Considerations

- Calculations based on current system time
- Accuracy depends on device's current datetime setting
- Recommended for recent time differences

### Potential Improvements

- Add custom date formatting options
- Support for more granular time representations
- Configurable time thresholds

---

## Paginated List Widget

A Flutter widget that provides a paginated list with built-in loading states, error handling, and infinite scrolling capabilities using Riverpod for state management.

## Features

- Infinite scrolling with customizable scroll threshold
- Pull-to-refresh functionality
- Built-in loading, error, and empty states
- Customizable widgets for all states
- Support for list separators
- Automatic pagination handling
- Built-in error handling and retry mechanisms

## Basic Usage

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
)
```

## Advanced Usage

```dart
PaginatedListWidget<User>(
  // Required parameters
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  
  // Optional customization
  loadTriggerThreshold: 0.8,
  enablePullToRefresh: true,
  padding: EdgeInsets.all(16.0),
  separatorBuilder: (context, index) => Divider(),
  
  // Custom state widgets
  loadingWidget: CustomLoadingSpinner(),
  errorWidget: CustomErrorWidget(),
  emptyWidget: CustomEmptyState(),
  bottomLoadingWidget: CustomBottomLoader(),
  bottomErrorWidget: CustomBottomError(),
  noMoreDataWidget: CustomNoMoreDataWidget(),
  
  // Optional scroll controller
  scrollController: myScrollController,
)
```

## Setting Up the Provider

Create a state notifier that extends `PaginatedListNotifier`:

```dart
final userListProvider = AutoDisposeStateNotifierProvider<UserListNotifier, PaginationState<User>>(
  (ref) => UserListNotifier(),
);

class UserListNotifier extends PaginatedListNotifier<User> {
  @override
  Future<List<User>> fetchPage(int page) async {
    // Implement your API call here
    final response = await api.getUsers(page: page, limit: pageSize);
    return response.users;
  }
}
```

## Customization Options

### Load Trigger Threshold

The `loadTriggerThreshold` parameter (default: 0.8) determines when to load the next page. It represents the scroll position as a percentage of the total scrollable area:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  loadTriggerThreshold: 0.7, // Load next page at 70% scroll
)
```

### Pull-to-Refresh

Enable or disable pull-to-refresh functionality:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  enablePullToRefresh: true, // Enables pull-to-refresh
)
```

### Custom State Widgets

Customize the appearance of various states:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  loadingWidget: Center(child: CircularProgressIndicator()),
  errorWidget: CustomErrorWidget(),
  emptyWidget: Center(child: Text('No users found')),
  bottomLoadingWidget: CustomBottomLoader(),
  bottomErrorWidget: CustomBottomError(),
  noMoreDataWidget: Center(child: Text('No more users')),
)
```

## Error Handling

The widget automatically handles errors and provides retry functionality. You can customize the error display using the `errorWidget` and `bottomErrorWidget` parameters.

---

### Coding Standards

- Follow Flutter/Dart best practices
- Use meaningful variable and function names
- Write comprehensive documentation

## Troubleshooting

- Common issues and their solutions
- Debugging tips specific to this template

## Performance Optimization

- List any performance-related configurations
- Mention used optimization techniques

## Security

- Brief overview of security measures
- Recommendations for secure usage
# Hamad Academy



## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://git.larsa.io/larsa/hamad_academy.git
git branch -M main
git push -uf origin main
```

## Integrate with your tools

- [ ] [Set up project integrations](https://git.larsa.io/larsa/hamad_academy/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Set auto-merge](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thanks to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README

Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
# Code Expert Flutter Template

![Logo](./assets/images/logo_full.png)

## Description

A brief overview of your Flutter application, its purpose, and key features.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run](#run)
- [Build](#build)
- [Deployment](#deployment)
- [Features](#features)
- [Usage](#usage)

## Features

Features of Template app:

- [Theme](#theme)
- [Routing](#routing)
- [Client](#client)
- [Multilingual](#multilingual)
- [Utilities](#utilities)
- [Log](#log)
- [Storage](#storage)
- [File Service](#storage)
- [Auth](#auth)

---

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK 3.32.6
- Dart SDK
- FVM - Flutter Version Management
- Android Studio or VS Code with Flutter extensions
- Simulator/Emulator or physical device for testing

### Recommended Versions

- Flutter: 3.32.6
- Dart: [Specify minimum/recommended version]

```bash
fvm use 3.32.6
```

### Recommended VsCode Extensions

[Flutter Riverpod Snippets](https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets)

[Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator)

[Dart Import Sorter](https://marketplace.visualstudio.com/items?itemName=aziznal.dart-import-sorter)

[Flutter Print Tools](https://marketplace.visualstudio.com/items?itemName=marinv.flutter-print-tools)

[Dart Barrel File Generator](https://marketplace.visualstudio.com/items?itemName=miquelddg.dart-barrel-file-generator)

[Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)

[Flutter Applog](https://marketplace.visualstudio.com/items?itemName=essasabbagh.flutter-applog)

---

## Installation

Provide instructions on how to install your app. Include any prerequisites and step-by-step installation guide.

### Clone the Repository

[Github link](https://)

```bash
git clone https://github.com/[your-username]/[your-repo-name].git
cd [your-repo-name]
```
If you haven't already, install the Firebase CLI.
```bash
firebase login
```
```bash
dart pub global activate flutterfire_cli 
```
### Setup Firebase Configs
```bash
flutterfire configure 
```
### Install Dependencies

```bash
flutter pub get
```

### Assets

Use Flutter assets vscode extension
[Flutter assets](https://marketplace.visualstudio.com/items?itemName=weekit.flutter-assets-gen2)

```yaml
flutter_assets:
  assets_path: assets/
  output_path: lib/core/constants/
  filename: images.dart
  classname: AppImages
  ignore_comments: true
  field_prefix:
```

Compress Flutter assets
[squoosh](https://squoosh.app/) -
[tinypng](https://tinypng.com/)

### Run

```bash
flutter run lib/main.dart 
```

### Change app name

- Run this command

```bash
dart run rename_app:main all="Hamad Academy"
```

- lib/configs/app_configs.dart

```dart
static const String appName = 'Hamad Academy';
```

- lib/locale/intl_XX.arb

```json
"appName": "Hamad Academy",
```

### Generates native splash

```bash
dart run flutter_native_splash:create
```

note: to edit configs go to: flutter_native_splash.yaml

## Build

### Build an APK

```bash
sh apk.sh
```

This command results in three APK files:

    build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    build/app/outputs/apk/release/app-arm64-v8a-release.apk
    build/app/outputs/apk/release/app-x86_64-release.apk

### Build an Android Bundle

You can use script to incremet app version and build a new bundle
and hnadle all build details like upload Flutter debug symbols

```bash
sh android.sh
```

The release bundle for your app is created at

    build/app/outputs/bundle/release/app.aab.

### Build an IOS

or to incremet app version and build a new version

```bash
sh ios.sh
```

    build/ios/archive/Runner.xcarchive

Use the Firebase CLI to upload Flutter debug symbols.
You need to upload the debug symbols before reporting a crash from an obfuscated code build.

```bash
firebase crashlytics:symbols:upload --app=1:839865712716:android:d947678144e9e5c22034e9 build/app/intermediates/stripped_native_libs/debug/out/lib

ios/Pods/FirebaseCrashlytics/upload-symbols -gsp ios/GoogleService-Info.plist -p ios build/ios/archive/Runner.xcarchive/dSYMs
```

---

## Deployment

### Deploy to Google play

- Need to create intrenal test
- Then create open test
- Then have to create closed test track
  - Closed test should be created for same version to 20 tester
  - Tester shouldnot be shared with internal tester list

### Deploy to Apple

---

# Usage

## Theme

lib/core/themes

```dart
color: Theme.of(context).shadowColor
color: Theme.of(context).colorScheme.onSurface
style: Theme.of(context).textTheme.bodyMedium
style: Theme.of(context).textTheme.bodyLarge
```

### Fonts

- Font Family: notoSansArabic Using Google font

```dart
class AppConfigs {
    ...
  // font family
  static const String fontFamily = 'Poppins';
}

class AppFont {
  static const String fontFamily = AppConfigs.fontFamily;
}
```

### Gradient

```dart
class AppGradient {
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF069ACC),
      Color(0xFF0594C6),
      Color(0xFF0483B6),
      Color(0xFF02679B),
      Color(0xFF004177),
      Color(0xFF003B71),
    ],
    stops: [
      0.1079,
      0.2481,
      0.446,
      0.6603,
      0.8995,
      0.9325,
    ],
  );
}
```

### Color Reference

| Color           | Hex                                                              |
| --------------- | ---------------------------------------------------------------- |
| Primary Color   | ![#007EA8](https://via.placeholder.com/10/007EA8?text=+) #007EA8 |
| Primary 50      | ![#EEF7FF](https://via.placeholder.com/10/EEF7FF?text=+) #EEF7FF |
| Primary 200     | ![#92CAFF](https://via.placeholder.com/10/92CAFF?text=+) #92CAFF |
| Primary 500     | ![#4FA1ED](https://via.placeholder.com/10/4FA1ED?text=+) #4FA1ED |
| Primary 700     | ![#11599C](https://via.placeholder.com/10/11599C?text=+) #11599C |
| Primary 900     | ![#003C73](https://via.placeholder.com/10/003C73?text=+) #003C73 |
| Secondary Color | ![#B0E7F9](https://via.placeholder.com/10/B0E7F9?text=+) #B0E7F9 |
| Secondary 50    | ![#E5F8FF](https://via.placeholder.com/10/E5F8FF?text=+) #E5F8FF |
| Secondary 200   | ![#5CD6FF](https://via.placeholder.com/10/5CD6FF?text=+) #5CD6FF |
| Secondary 500   | ![#00B2ED](https://via.placeholder.com/10/00B2ED?text=+) #00B2ED |
| Secondary 700   | ![#00759B](https://via.placeholder.com/10/00759B?text=+) #00759B |
| Secondary 900   | ![#005673](https://via.placeholder.com/10/005673?text=+) #005673 |
| Gray 50         | ![#F9FAFB](https://via.placeholder.com/10/F9FAFB?text=+) #F9FAFB |
| Gray 100        | ![#F3F4F6](https://via.placeholder.com/10/F3F4F6?text=+) #F3F4F6 |
| Gray 200        | ![#E5E7EB](https://via.placeholder.com/10/E5E7EB?text=+) #E5E7EB |
| Gray 300        | ![#D1D5DB](https://via.placeholder.com/10/D1D5DB?text=+) #D1D5DB |
| Gray 400        | ![#9CA3AF](https://via.placeholder.com/10/9CA3AF?text=+) #9CA3AF |
| Gray 500        | ![#687280](https://via.placeholder.com/10/687280?text=+) #687280 |
| Gray 600        | ![#485563](https://via.placeholder.com/10/485563?text=+) #485563 |
| Gray 700        | ![#374151](https://via.placeholder.com/10/374151?text=+) #374151 |
| Gray 800        | ![#1F2937](https://via.placeholder.com/10/1F2937?text=+) #1F2937 |
| Gray 900        | ![#111827](https://via.placeholder.com/10/111827?text=+) #111827 |
| Light Primary   | ![#E6F7FD](https://via.placeholder.com/10/E6F7FD?text=+) #E6F7FD |
| Accent Color    | ![#FF9800](https://via.placeholder.com/10/FF9800?text=+) #FF9800 |
| Light Color     | ![#E6ECF1](https://via.placeholder.com/10/E6ECF1?text=+) #E6ECF1 |
| White           | ![#FFFFFF](https://via.placeholder.com/10/FFFFFF?text=+) #FFFFFF |
| Text Primary    | ![#001930](https://via.placeholder.com/10/001930?text=+) #001930 |
| Text Secondary  | ![#003769](https://via.placeholder.com/10/003769?text=+) #003769 |
| Hint Color      | ![#8AA5BF](https://via.placeholder.com/10/8AA5BF?text=+) #8AA5BF |
| Border Color    | ![#D1D5DB](https://via.placeholder.com/10/D1D5DB?text=+) #D1D5DB |
| Primary Dark    | ![#004080](https://via.placeholder.com/10/004080?text=+) #004080 |
| Primary Light   | ![#80BFFF](https://via.placeholder.com/10/80BFFF?text=+) #80BFFF |
| Success 600     | ![#039855](https://via.placeholder.com/10/039855?text=+) #039855 |
| Success 100     | ![#D1FADF](https://via.placeholder.com/10/D1FADF?text=+) #D1FADF |
| Success 50      | ![#ECFDF3](https://via.placeholder.com/10/ECFDF3?text=+) #ECFDF3 |
| Error 600       | ![#E53935](https://via.placeholder.com/10/E53935?text=+) #E53935 |

---

## Routing

Libraries & Tools Used

- [go_router](https://pub.dev/packages/go_router)

lib/core/router

Redirection changes the location to a new one based on auth state.

```dart
final routerProvider
```

To navigate to a route using its name, call **goNamed()**:

```dart
 // example
context.goNamed(
  AppRouters.checkEmail.name,
  pathParameters: {
    "email": _emailnameController.text,
  },
);
```

To configure a named route, use the name parameter:

```dart
GoRoute(
  path: AppRoutes.splash.path,
  name: AppRoutes.splash.name,
  builder: (_, __) => const SplashScreen(),
),
```

lib\configs\routes\app_router.dart

```dart
enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  ...
}
```

---

## Client

The `ApiClient` is a robust, singleton network service utility built with Dio, providing a centralized and configurable approach to making HTTP network requests in the application.

### Features

- Centralized HTTP request management
- Dio-based network service
- Configurable base options
- Debug logging
- Flexible request methods
- Timeout and cancellation support

### Providers

```dart
// Dio Provider
final dioProvider = Provider((ref) => Dio());

// Network Service Provider
final networkServiceProvider = Provider((ref) => ApiClient());
```

### Configuration

#### Base Options

- **Base URL**: Configured from `AppConfigs.baseUrl`
- **Timeout Duration**: Consistent across receive, connect, and send operations
- **Response Type**: JSON
- **Content Type**: Application JSON
- **Headers**:
  - `Accept: application/json`

### Request Methods

#### GET Request

```dart
Future get(
  String path, {
  Map? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onReceiveProgress,
})
```

#### POST Request

```dart
Future post(
  String path, {
  dynamic data,
  Map? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
})
```

### Interceptors

- **Pretty Dio Logger**:
  - Enabled only in debug mode
  - Logs request/response headers and bodies
  - Configurable logging verbosity

### Usage Examples

#### Basic GET Request

```dart
final apiClient = ApiClient();
try {
  final response = await apiClient.get('/users');
  // Process response
} catch (e) {
  // Handle error
}
```

#### POST Request with Data

```dart
final data = {'username': 'example', 'password': 'password'};
final response = await apiClient.post(
  '/login', 
  data: data,
  options: Options(headers: {'Custom-Header': 'value'})
);
```

### Advanced Features

- **Cancel Requests**: Use `CancelToken` to abort ongoing requests
- **Progress Tracking**: Monitor upload/download progress
- **Custom Headers**: Easily add custom headers to requests

### Best Practices

- Always handle potential network exceptions
- Use `try-catch` for error management
- Implement proper error handling and user feedback
- Consider network connectivity before making requests
- Use cancellation tokens for long-running or unnecessary requests

### Error Handling

```dart
try {
  final response = await apiClient.get('/endpoint');
} on DioException catch (e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      // Handle connection timeout
      break;
    case DioExceptionType.receiveTimeout:
      // Handle receive timeout
      break;
    case DioExceptionType.sendTimeout:
      // Handle send timeout
      break;
    case DioExceptionType.badResponse:
      // Handle bad response
      break;
    default:
      // Handle other errors
  }
}
```

### Performance Considerations

- Minimal overhead with singleton pattern
- Efficient request management
- Configurable logging for debugging
- Low memory footprint

### Recommended Packages

- `dio`: Core HTTP networking
- `pretty_dio_logger`: Debugging and logging
- `dio_cache_interceptor`: Optional request caching

### Future Improvements

- Implement comprehensive authentication interceptor
- Add more robust error handling
- Support for request/response encryption
- Advanced caching mechanisms

---

## Network Connectivity Utility

The Network Info utility provides a robust and abstracted way to monitor and check network connectivity within the application using the `connectivity_plus` package and Riverpod state management.

### Features

- Centralized network connectivity management
- Multiple network type detection
- Easy-to-use connectivity checking
- Riverpod provider integration
- Comprehensive connectivity status reporting

### Connectivity Providers

#### Connectivity Provider

```dart
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});
```

#### Network Info Provider

```dart
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.read(connectivityProvider));
});
```

### Connectivity Status

The utility supports multiple network connectivity states:

- **Connected**: Device is connected to a network
- **Disconnected**: No network connection available
- **Not Determined**: Unable to determine network state

### Supported Network Types

- Mobile Network
- Wi-Fi
- Ethernet
- VPN
- Bluetooth
- Other network types

### Usage Examples

#### Checking Network Connectivity

```dart
// Create an instance of NetworkInfo
final networkInfo = NetworkInfo(Connectivity());

// Check if device is connected
bool isConnected = await networkInfo.isConnected;

// Get detailed connectivity status
ConnectivityStatus status = await networkInfo.checkConnectivity();
```

#### Using with Riverpod

```dart
// In a Riverpod widget or provider
final networkInfo = ref.watch(networkInfoProvider);
final isConnected = await networkInfo.isConnected;
```

### Best Practices

- Use network connectivity checks before network-dependent operations
- Handle different connectivity scenarios gracefully
- Provide user-friendly feedback during connectivity changes
- Consider implementing a connectivity listener for real-time updates

### Potential Use Cases

- Prevent network requests when offline
- Show/hide content based on connectivity
- Implement offline mode
- Retry failed network operations
- Display network status indicators

### Error Handling

- Always handle potential connectivity exceptions
- Provide fallback mechanisms for network-dependent features
- Inform users about connection issues

### Platform Considerations

- Different behavior on iOS, Android, and other platforms
- VPN detection might vary across platforms
- Wi-Fi and mobile network detection may have nuances

### Performance Notes

- Lightweight and efficient connectivity checking
- Minimal overhead in network status detection
- Quick response time for connectivity queries

### Recommended Packages

- `connectivity_plus`: Core connectivity detection
- `riverpod`: State management integration

---

## Multilingual

```yaml
flutter_localizations:
  sdk: flutter
intl: ^0.18.1
intl_utils: ^2.8.5
```

### Add ARB files

Add the following vscode Extension
  [flutter-intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

  [Fix my ARB](https://marketplace.visualstudio.com/items?itemName=coodooGmbH.fixmyarb)

To generate boilerplate code for localization, run the generate program inside directory where your pubspec.yaml file is located:

<https://www.linkedin.com/posts/shehab-mohamed-_%D9%81%D9%89-%D8%B7%D8%B1%D9%82-%D9%83%D8%AA%D9%8A%D8%B1-%D9%81-%D9%81%D9%84%D8%A7%D8%AA%D8%B1-%D8%A7%D9%86%D9%83-%D8%AA%D8%B9%D9%85%D9%84-localizations-activity-7253578654897606656--CFQ/?utm_source=share&utm_medium=member_desktop>

Create Local Provider

```dart
const defaultLocale = Locale('ar', '');
const languageCodeKey = 'languageCode';

final storageService = locator<StorageService>();

final localProvider = StateNotifierProvider<LocalProvider, Locale>(
  (_) {
    final languageCode = storageService.read(languageCodeKey);
    return LocalProvider(
      languageCode.isEmpty ? defaultLocale.languageCode : languageCode,
    );
  },
);

class LocalProvider extends StateNotifier<Locale> {
  LocalProvider(String languageCode) : super(Locale(languageCode));

  void changeLocale(Locale? locale) {
    state = locale ?? defaultLocale;
    storageService.write(languageCodeKey, state.languageCode);
  }

  final supportedLocales = const [
    Locale('en'), 
    Locale('ar'), 
  ];
}
```

To change loacal use LocaleChanger widget

```dart
class LocaleChanger extends ConsumerWidget {
  const LocaleChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localProvider);
    final localeNotifier = ref.read(localProvider.notifier);

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            S.of(context).applanguage,
            style: body14,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<Locale>(
          value: locale,
          onChanged: localeNotifier.changeLocale,
          items: localeNotifier.supportedLocales.map((val) {
            final lang =
                languages.firstWhere((e) => e['code'] == val.languageCode);
            return DropdownMenuItem(
              value: val,
              child: Row(
                children: <Widget>[
                  Text(lang['flag']),
                  const SizedBox(width: 8.0),
                  Text(lang['name']),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
```

To use translation

```dart
Text(
    S.of(context).welcomeBack,
)
```

---

## Auth

Libraries & Tools Used:

- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)

To get auth state, fetch data using AuthService
lib\services\network\auth_service.dart

```dart
class AuthService {
  final DioClient client;

  AuthService(this.client);

  Future<AuthModel> login(String username, String password) async {
    final formData = FormData.fromMap({
      'email_or_username': username,
      'password': password,
    });

    final res = await client.post(
      loginPath,
      data: formData,
    );

    return AuthModel.fromJson(res.data);
  }

  Future<AuthModel> register(RegisterParam param) async {
    final formData = FormData.fromMap(param.toJson());

    final res = await client.post(
      registerPath,
      data: formData,
    );

    return AuthModel.fromJson(res.data);
  }

  Future<void> logout() async {
    final res = await client.post(logoutPath);
  }

  Future<MeModel> getUserInfo() async {
    final res = await client.post(mePath);
    return MeModel.fromJson(res.data);
  }
}
```

To get current state use ConsumerWidget with AuthProvider

```dart
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          auth.isLoggedIn ?? false
              ? GestureDetector(
                  onTap: () {
                    context.pop();
                    context.goNamed(AppRouter.profile);
                  },
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auth.user?.name ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          auth.user?.email ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                // not logged
              : const DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Logo(
                      width: 60,
                    ),
                  ),
                ),
         ...
        ],
      ),
    );
  }
}
```

---

## Log

The application uses a custom `AppLog` utility for structured, colorful, and configurable logging across different environments.

### Features

- Multiple log levels: Success, Info, Warning, Debug, Error
- Color-coded console output
- Configurable log levels
- Metadata support
- Release mode logging control

### Log Levels

- **Success** (🟢): Indicates successful operations
- **Info** (🔵): General informational messages
- **Warning** (🟠): Potential issues or important notifications
- **Debug** (⚪️): Detailed debugging information
- **Error** (🚫): Error and critical issue logs

### Usage Examples

```dart
// Basic logging
AppLog.success('Operation completed successfully');
AppLog.info('Application started', 'Startup');
AppLog.warning('Low disk space', 'Storage');
AppLog.debug('Fetching user data');
AppLog.error('Failed to load user profile', 'Authentication', 
    metadata: {'userId': 123});

// Configuring log level
AppLog.setLogLevel(LogLevel.warning); // Only show warnings and errors
```

### Best Practices

- Use appropriate log levels
- Include meaningful tags
- Add metadata for complex error tracking
- Avoid logging sensitive information

### Configuration Options

#### Setting Log Level

Control which log levels are displayed:

```dart
// Only show warnings and errors
AppLog.setLogLevel(LogLevel.warning);
```

#### Release Mode Logging

By default, logs are disabled in release mode. To enable:

```dart
AppLog.enableReleaseLogging = true;
```

#### Customizing Log Styles

You can customize the appearance of log levels:

```dart
AppLog.setLogStyle(LogLevel.success, 
  LogStyle(colorCode: '35', emoji: '🌟')
);
```

---

## Utilities

## SnackBar

The SnackBar utility provides a convenient and consistent way to display temporary notifications across the application. It supports different types of notifications with color-coded backgrounds and integrates with the app's logging system.

#### Features

- Multiple SnackBar types: Success, Error, Warning, Info
- Consistent styling
- Automatic logging of messages
- Customizable actions
- Floating behavior

### Usage Examples

```dart
// Success Notification
AppSnackBar.showSuccess('Operation completed successfully');

// Error Notification
AppSnackBar.showError('Something went wrong');

// Warning Notification
showWarningSnackbar('Proceed with caution');

// Info Notification
showInfoSnackbar('Additional information');
```

#### SnackBar with Custom Action

```dart
AppSnackBar.showSuccess(
  'Saved successfully', 
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Undo action logic
    }
  )
);
```

### SnackBar Types

- **Success SnackBar** (Green): Positive outcomes and successful operations
- **Error SnackBar** (Red): Error messages and critical notifications
- **Warning SnackBar** (Amber): Cautionary or important messages
- **Info SnackBar** (Blue): Informational messages and updates

### Important Notes

- Requires a global `scaffoldKey` to be set up in your app
- Automatically logs messages using `AppLog`
- Default action is to dismiss the SnackBar
- Only one SnackBar is shown at a time

### Best Practices

- Use appropriate SnackBar type based on the message context
- Keep messages concise and clear
- Use SnackBars for temporary, non-blocking notifications
- Avoid overusing SnackBars to prevent user fatigue

---

## Custom Alert Dialog

The `CustomAlertDialog` is a flexible and visually appealing alert dialog component that supports multiple dialog types with dynamic styling and behavior.

### Features

- Four distinct dialog types: Error, Warning, Info, Success
- Dynamic icon and color based on dialog type
- Customizable title, description, and button texts
- Centered layout with rounded design
- Themed typography
- Callback support for accept action

### Dialog Types

1. **Error Dialog** (Red)
   - Used for critical or destructive actions
   - Error-related confirmations

2. **Warning Dialog** (Orange)
   - Cautions about potential consequences
   - Actions requiring careful consideration

3. **Info Dialog** (Primary Color)
   - Informational messages
   - Neutral notifications

4. **Success Dialog** (Green)
   - Positive confirmations
   - Celebration or completion messages

### Usage Examples

#### Basic Alert Dialog

```dart
await showDialog<bool>(
  context: context,
  builder: (ctx) => CustomAlertDialog(
    title: 'Delete Account',
    description: 'Are you sure you want to delete your account?',
    acceptText: 'Delete',
    cancelText: 'Cancel',
    type: AlertDialogType.error,
    onAccept: () {
      // Perform deletion logic
    },
  ),
);
```

#### Different Dialog Types

```dart
// Warning Dialog
CustomAlertDialog(
  title: 'Unsaved Changes',
  description: 'You have unsaved changes. Proceed?',
  type: AlertDialogType.warning,
  // ...
)

// Info Dialog
CustomAlertDialog(
  title: 'Update Available',
  description: 'A new version of the app is ready.',
  type: AlertDialogType.info,
  // ...
)

// Success Dialog
CustomAlertDialog(
  title: 'Profile Updated',
  description: 'Your profile has been successfully updated.',
  type: AlertDialogType.success,
  // ...
)
```

### Customization

- Fully customizable text for title, description, and buttons
- Supports custom accept action callback
- Inherits theme styling for consistent design

### Best Practices

- Use appropriate dialog type based on context
- Keep titles and descriptions concise
- Provide clear and specific actions
- Use dialogs for important confirmations or information
- Avoid overusing dialogs to prevent user frustration

### Accessibility Considerations

- Centered layout for better visibility
- Large, clear icons
- High-contrast color scheme
- Readable typography

---

## Date Helper Utility

The `DateHelper` class provides a human-readable, localized representation of time elapsed since a given date. It converts raw datetime differences into friendly, easy-to-read time phrases.

### Features

- Supports multiple time granularities:
  - Just now
  - Seconds
  - Minutes
  - Hours
  - Days
  - Weeks
  - Months
  - Years
- Fully localized time representations
- Simple, static method for easy usage

### Supported Time Ranges

| Range       | Output Format   |
| ----------- | --------------- |
| < 5 seconds | "Just now"      |
| < 1 minute  | "X seconds ago" |
| < 1 hour    | "X minutes ago" |
| < 24 hours  | "X hours ago"   |
| < 7 days    | "X days ago"    |
| < 30 days   | "X weeks ago"   |
| < 365 days  | "X months ago"  |
| 1 year+     | "X years ago"   |

### Usage Examples

```dart
// Basic usage
DateTime pastDate = DateTime.now().subtract(Duration(hours: 3));
String readableTime = DateHelper.timeAgo(pastDate);
print(readableTime); // "3 hours ago"

// Different time ranges
DateTime justNow = DateTime.now().subtract(Duration(seconds: 3));
DateTime fewMinutesAgo = DateTime.now().subtract(Duration(minutes: 5));
DateTime yesterdayDate = DateTime.now().subtract(Duration(days: 1));
DateTime oldDate = DateTime.now().subtract(Duration(days: 365));

print(DateHelper.timeAgo(justNow));     // "Just now"
print(DateHelper.timeAgo(fewMinutesAgo)); // "5 minutes ago"
print(DateHelper.timeAgo(yesterdayDate)); // "1 day ago"
print(DateHelper.timeAgo(oldDate));       // "1 year ago"
```

### Localization

- Uses `S.current` for language-specific time representations
- Supports multiple languages through generated localization files
- Automatic translation of time phrases

### Best Practices

- Use for displaying relative timestamps
- Ideal for social media feeds, chat logs, and activity streams
- Provides more user-friendly experience than raw datetime
- Lightweight and performant

### Considerations

- Calculations based on current system time
- Accuracy depends on device's current datetime setting
- Recommended for recent time differences

### Potential Improvements

- Add custom date formatting options
- Support for more granular time representations
- Configurable time thresholds

---

## Paginated List Widget

A Flutter widget that provides a paginated list with built-in loading states, error handling, and infinite scrolling capabilities using Riverpod for state management.

## Features

- Infinite scrolling with customizable scroll threshold
- Pull-to-refresh functionality
- Built-in loading, error, and empty states
- Customizable widgets for all states
- Support for list separators
- Automatic pagination handling
- Built-in error handling and retry mechanisms

## Basic Usage

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
)
```

## Advanced Usage

```dart
PaginatedListWidget<User>(
  // Required parameters
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  
  // Optional customization
  loadTriggerThreshold: 0.8,
  enablePullToRefresh: true,
  padding: EdgeInsets.all(16.0),
  separatorBuilder: (context, index) => Divider(),
  
  // Custom state widgets
  loadingWidget: CustomLoadingSpinner(),
  errorWidget: CustomErrorWidget(),
  emptyWidget: CustomEmptyState(),
  bottomLoadingWidget: CustomBottomLoader(),
  bottomErrorWidget: CustomBottomError(),
  noMoreDataWidget: CustomNoMoreDataWidget(),
  
  // Optional scroll controller
  scrollController: myScrollController,
)
```

## Setting Up the Provider

Create a state notifier that extends `PaginatedListNotifier`:

```dart
final userListProvider = AutoDisposeStateNotifierProvider<UserListNotifier, PaginationState<User>>(
  (ref) => UserListNotifier(),
);

class UserListNotifier extends PaginatedListNotifier<User> {
  @override
  Future<List<User>> fetchPage(int page) async {
    // Implement your API call here
    final response = await api.getUsers(page: page, limit: pageSize);
    return response.users;
  }
}
```

## Customization Options

### Load Trigger Threshold

The `loadTriggerThreshold` parameter (default: 0.8) determines when to load the next page. It represents the scroll position as a percentage of the total scrollable area:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  loadTriggerThreshold: 0.7, // Load next page at 70% scroll
)
```

### Pull-to-Refresh

Enable or disable pull-to-refresh functionality:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  enablePullToRefresh: true, // Enables pull-to-refresh
)
```

### Custom State Widgets

Customize the appearance of various states:

```dart
PaginatedListWidget<User>(
  provider: userListProvider,
  itemBuilder: (context, user) => UserListItem(user: user),
  loadingWidget: Center(child: CircularProgressIndicator()),
  errorWidget: CustomErrorWidget(),
  emptyWidget: Center(child: Text('No users found')),
  bottomLoadingWidget: CustomBottomLoader(),
  bottomErrorWidget: CustomBottomError(),
  noMoreDataWidget: Center(child: Text('No more users')),
)
```

## Error Handling

The widget automatically handles errors and provides retry functionality. You can customize the error display using the `errorWidget` and `bottomErrorWidget` parameters.

---

### Coding Standards

- Follow Flutter/Dart best practices
- Use meaningful variable and function names
- Write comprehensive documentation

## Troubleshooting

- Common issues and their solutions
- Debugging tips specific to this template

## Performance Optimization

- List any performance-related configurations
- Mention used optimization techniques

## Security

- Brief overview of security measures
- Recommendations for secure usage
