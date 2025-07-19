import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/main_appbar.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/features/settings/widgets/locale_menu.dart';

import 'pages.dart';
import 'provider/onboarding_provider.dart';
import 'widgets/onboarding_page_widget.dart';
import 'widgets/page_indicator.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      appBar: LiteAppBar(
        // backgroundColor: Colors.transparent,
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
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageIndicator(currentPage: currentPage),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: onboardingNotifier.nextPage,
                    child: Text(
                      onboardingNotifier.isLastPage
                          ? S.of(context).getStarted
                          : S.of(context).next,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onboardingNotifier.skip,
                    child: Text(S.of(context).skip),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        itemCount: pages.length,
        controller: onboardingNotifier.pageController,
        onPageChanged: onboardingNotifier.setPage,
        itemBuilder: (context, index) {
          return OnboardingPage(pageData: pages[index]);
        },
      ),
    );
  }
}
