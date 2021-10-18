// ignore_for_file: file_names
import 'package:example/mediaQuery/size_helpers.dart';
import 'package:example/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class TextFieldDatePicker2 extends StatefulWidget {
  static const routeName = 'textFieldDatePicker2';
  const TextFieldDatePicker2({Key? key}) : super(key: key);

  @override
  _TextFieldDatePicker2State createState() => _TextFieldDatePicker2State();
}

class _TextFieldDatePicker2State extends State<TextFieldDatePicker2> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'TextField Date Picker Example 2',
          style: TextStyle(
            fontSize: displayWidth(context) * 0.060,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const LabelText(
              labelValue: 'Date',
            ),
            TextfieldDatePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: DateTime.now().year,
              cupertinoDatePickerMinimumDate: DateTime.now(),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat('dd-MMMM-' 'yyyy'),
              textfieldDatePickerController: _controller,
              style: TextStyle(
                fontSize: displayWidth(context) * 0.040,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                //errorText: errorTextValue,
                helperStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.031,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Colors.white,
                    )),
                hintText: "Select Date",
                hintStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
