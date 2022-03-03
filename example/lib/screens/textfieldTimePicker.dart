// ignore_for_file: file_names

import 'package:example/mediaQuery/size_helpers.dart';
import 'package:example/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

class TextFieldTimePicker extends StatefulWidget {
  static const routeName = '/textFieldTimePicker';
  const TextFieldTimePicker({Key? key}) : super(key: key);

  @override
  _TextFieldTimePickerState createState() => _TextFieldTimePickerState();
}

class _TextFieldTimePickerState extends State<TextFieldTimePicker> {
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
          'TextField Time Picker Example',
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
              labelValue: 'Time',
            ),
            TextfieldTimePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDateInitialDateTime: DateTime.now(),
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
                hintText: 'Select Time',
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
