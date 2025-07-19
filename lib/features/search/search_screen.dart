import 'package:flutter/material.dart';

import 'package:hamad/core/locale/generated/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).searchScreen)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: S.of(context).search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search_rounded),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your dynamic item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.search_rounded),
                    title: Text('Search Result $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
