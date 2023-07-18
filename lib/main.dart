import 'package:flutter/material.dart';
import 'package:flutter_linkedin/screens/date_picker_validation.dart';
import 'package:flutter_linkedin/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waseem Flutter LinkedIn',
      theme: getThemes(),
      home: const DatePickerValidation(),
    );
  }
}
