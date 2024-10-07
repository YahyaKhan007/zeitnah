import 'dart:developer';

import 'package:intl/intl.dart';

String formatDate({required DateTime date}) {
  log("Passed Date $date");

  String showDate = '';
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime tomorrow = today.add(const Duration(days: 1));

  if (date.year == today.year &&
      date.month == today.month &&
      date.day == today.day) {
    showDate = 'Today (${DateFormat('dd.MM').format(date)})';
  } else if (date.year == tomorrow.year &&
      date.month == tomorrow.month &&
      date.day == tomorrow.day) {
    showDate = 'Tomorrow (${DateFormat('dd.MM').format(date)})';
  } else {
    showDate = DateFormat('yyyy-MM-dd').format(date);
  }

  return showDate;
}

String formatTime({required DateTime time}) {
  return DateFormat('HH:mm').format(time);
}
