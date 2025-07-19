import 'package:flutter/material.dart';

enum SessionStatus {
  liveNow,
  liveToday,
  upcoming,
  attended,
  excusedAbsence,
  unjustifiedAbsence;

  // Color getStatusColor() {
  //   return switch (this) {
  //     SessionStatus.liveToday => Colors.amber.shade100,
  //     SessionStatus.upcoming => Colors.green.shade100,
  //     SessionStatus.attended => Colors.blue.shade100,
  //     SessionStatus.unjustifiedAbsence => Colors.red.shade100,
  //     SessionStatus.excusedAbsence => Colors.red.shade100,
  //     SessionStatus.liveNow => Colors.red,
  //   };
  // }
}
