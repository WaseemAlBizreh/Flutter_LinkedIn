import 'package:flutter/material.dart';

class Utils {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 8),
      lastDate: DateTime(2101),
    );
    return picked;
  }

  static Future<DateTime?> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null){
      DateTime dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        picked.hour,
        picked.minute,
      );
      return dateTime;
    } else {
      return null;
    }
  }
}

extension IterableExt on Iterable<Widget> {
  Iterable<Widget> toAddSeparator({required Widget element}) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}
