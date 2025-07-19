import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/configs/app_configs.dart';

import '../providers/locale_provider.dart';

class LocaleDropdown extends ConsumerWidget {
  const LocaleDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeMode = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);

    return ButtonTheme(
      alignedDropdown: true,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      child: DropdownButtonFormField<Locale>(
        elevation: 2,
        iconSize: 36,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        borderRadius: BorderRadius.circular(8.0),
        value: localeMode,
        decoration: const InputDecoration(
          // labelText: 'Theme Mode',
        ),
        onChanged: localeNotifier.changeLocale,
        items: AppConfigs.supportedLocales.map((option) {
          return DropdownMenuItem<Locale>(
            value: Locale(option['locale'] as String),
            child: Row(
              children: [
                Text(option['icon'] as String),
                const SizedBox(width: 8),
                Text(option['name'] as String),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
