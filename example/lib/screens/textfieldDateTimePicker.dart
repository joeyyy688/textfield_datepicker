// ignore_for_file: file_names
import 'package:example/mediaQuery/size_helpers.dart';
import 'package:example/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
import 'package:intl/intl.dart';

class TextFieldDateTimePicker extends StatefulWidget {
  static const routeName = '/textFieldDateTimePicker';
  const TextFieldDateTimePicker({Key? key}) : super(key: key);

  @override
  _TextFieldDateTimePickerState createState() =>
      _TextFieldDateTimePickerState();
}

class _TextFieldDateTimePickerState extends State<TextFieldDateTimePicker> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 7,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'TextField Date Time Picker Example',
          style: TextStyle(
            fontSize: displayWidth(context) * 0.045,
            color: Colors.white,
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
              labelValue: 'Date Time',
            ),
            TextfieldDateAndTimePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat.yMMMEd(),
              materialTimePickerUse24hrFormat: false,
              cupertinoTimePickerMinuteInterval: 1,
              cupertinoTimePickerUse24hFormat: false,
              textfieldDateAndTimePickerController: _controller,
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
                hintText: 'Select Date',
                hintStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              materialInitialTime: TimeOfDay.now(),
            ),
          ],
        ),
      ),
    );
  }
}
