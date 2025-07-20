import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

import 'reminder_card.dart';

class ReminderCarousel extends StatelessWidget {
  const ReminderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final reminders = [
      {
        'title':
            'اقترب الوقت! جلسة شيماء مع المعلمة روان تبدأ الساعة 5:00 مساءً',
        'cta': 'تفاصيل الجلسة',
        'bgColor': AppColors.color2.withValues(alpha: .1),
        'textColor': AppColors.color2,
      },
      {
        'title':
            'لدى الطفل أحمد اختبار في مادة العلوم غدًا الساعة 4:00 مساءً. تأكد من استعداد طفلك!',
        'cta': 'تفاصيل الاختبار',
        'bgColor': AppColors.accent500.withValues(alpha: .1),
        'textColor': AppColors.accent500,
      },
      {
        'title':
            'وظيفة "حل مسائل الجمع" لم تُسلم بعد، الموعد النهائي اليوم الساعة 8:00 مساءً.',
        'cta': 'تفاصيل الوظيفة',
        'bgColor': AppColors.blue.withValues(alpha: .1),
        'textColor': AppColors.blue,
      },
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: reminders.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ReminderCard(
            title: reminder['title'] as String,
            cta: reminder['cta'] as String,
            bgColor: reminder['bgColor'] as Color,
            textColor: reminder['textColor'] as Color,
          );
        },
      ),
    );
  }
}
