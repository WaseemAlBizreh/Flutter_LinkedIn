import 'package:flutter/material.dart';
import 'package:flutter_linkedin/theme/app_color.dart';
import 'package:flutter_linkedin/utils/utils.dart';
import 'package:intl/intl.dart';

class DatePickerValidation extends StatefulWidget {
  const DatePickerValidation({Key? key}) : super(key: key);

  @override
  State<DatePickerValidation> createState() => _DatePickerValidationState();
}

class _DatePickerValidationState extends State<DatePickerValidation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? date;

  void _submit() {
    formKey.currentState!.validate();
  }

  void selectDate() async {
    DateTime? pickedDate = await Utils.selectDate(context);
    setState(() {
      date = pickedDate;
      if (date != null) {
        dateController = TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(date!),
        );
      } else {
        dateController = TextEditingController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("DatePicker Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                enabled: true,
                controller: nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                cursorColor: AppColors.primaryColor,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "empty field";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: "Type your name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: selectDate,
                child: TextFormField(
                  enabled: false,
                  controller: dateController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: AppColors.primaryColor,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "empty field";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: "Type your date",
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ]
                .toAddSeparator(
                  element: const SizedBox(
                    height: 20,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        tooltip: 'Submit',
        child: const Icon(Icons.check),
      ),
    );
  }
}
