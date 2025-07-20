import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/logo.dart';

class SupervisorHomePage extends ConsumerWidget {
  const SupervisorHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 120 + 24,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Logo(width: 120),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                child: const Text('Supervisor Home Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
