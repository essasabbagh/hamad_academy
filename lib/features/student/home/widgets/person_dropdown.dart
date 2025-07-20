import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

class PersonDropdown extends StatefulWidget {
  const PersonDropdown({super.key});

  @override
  State<PersonDropdown> createState() => _PersonDropdownState();
}

class _PersonDropdownState extends State<PersonDropdown> {
  String selectedPerson = 'شيماء';

  final List<Map<String, dynamic>> people = [
    {
      'name': 'شيماء',
      'image': 'https://i.pravatar.cc/150',
    },
    {
      'name': 'آمنة',
      'image': 'https://i.pravatar.cc/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(32),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          borderRadius: BorderRadius.circular(16.0),
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          // iconSize: 36,
          // icon: const Icon(Icons.arrow_drop_down),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.neutral500,
          ),
          value: selectedPerson,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedPerson = newValue;
              });
            }
          },
          items: people.map((person) {
            return DropdownMenuItem<String>(
              value: person['name'],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(person['image']),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    person['name'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
