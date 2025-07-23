import 'package:flutter/material.dart';

import 'package:hamad/components/main/logo.dart';
import 'package:hamad/components/main/main_appbar.dart';

class LessonPlayerPage extends StatelessWidget {
  const LessonPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: Logo(
          width: 120,
        ),
      ),
      body: Center(
        child: Text('This is the lesson player page.'),
      ),
    );
  }
}
