import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title, this.actions, this.bottom})
    : assert(
        title is String || title is Widget,
        'Title must be a String or a Widget',
      );

  final Object title; // Can be String or Widget
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    // title: ,
    title: title is String
        ? Text(
            title as String,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        : title as Widget,

    // titleSpacing: 0,
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
    actions: actions,
    bottom: bottom,
  );
}

class LiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LiteAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.actions,
    this.bottom,
  });

  final String? title;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,

        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
