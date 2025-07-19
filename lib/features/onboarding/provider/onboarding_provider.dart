import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/initialize_app.dart';

import '../constants/onboarding_constants.dart';
import '../pages.dart';

final storage = locator<StorageService>();

class OnboardingState extends StateNotifier<int> {
  OnboardingState(this.ref) : super(0) {
    _timer = Timer.periodic(onboardingTimerDuration, (Timer timer) {
      if (!isLastPage) {
        state++;
      } else {
        state = 0; // Reset to the first page and start over
      }

      pageController.animateToPage(
        state,
        duration: onboardingDuration,
        curve: onboardingCurves,
      );
    });
  }

  Timer? _timer;
  final Ref ref;
  final pageController = PageController();

  void setPage(int pageIndex) {
    state = pageIndex;
  }

  bool get isLastPage => state == pages.length - 1;
  bool get isFirstPage => state == 0;

  void nextPage() {
    if (isLastPage) {
      skip();
      return;
    }

    pageController.nextPage(
      duration: onboardingDuration,
      curve: onboardingCurves,
    );
  }

  void previousPage() {
    if (isFirstPage) {
      pageController.previousPage(
        duration: onboardingDuration,
        curve: onboardingCurves,
      );
    }
  }

  void skip() {
    storage.saveBool(onboardingKey, true);
    // Navigate to the next screen
    ref.read(routerProvider).goNamed(AppRoutes.home.name);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    _timer!.cancel();
  }
}

final onboardingProvider =
    StateNotifierProvider.autoDispose<OnboardingState, int>(
      OnboardingState.new,
    );
