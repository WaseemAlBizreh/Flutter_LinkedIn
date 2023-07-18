import 'package:flutter/material.dart';
import 'package:flutter_linkedin/theme/app_color.dart';

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
