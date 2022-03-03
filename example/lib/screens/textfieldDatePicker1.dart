// ignore_for_file: file_names
import 'package:example/mediaQuery/size_helpers.dart';
import 'package:example/screens/textfieldDatePicker2.dart';
import 'package:example/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class TextFieldDatePickerDemo1 extends StatefulWidget {
  static const routeName = '/textFieldDatePickerDemo';
  const TextFieldDatePickerDemo1({Key? key}) : super(key: key);

  @override
  _TextFieldDatePickerDemo1State createState() =>
      _TextFieldDatePickerDemo1State();
}

class _TextFieldDatePickerDemo1State extends State<TextFieldDatePickerDemo1> {
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
          'TextField Date Picker Example 1',
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
              labelValue: 'Date',
            ),
            TextfieldDatePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
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
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: const Text('See Next Page for Example 2'),
              onPressed: () {
                Navigator.of(context).pushNamed(TextFieldDatePicker2.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
