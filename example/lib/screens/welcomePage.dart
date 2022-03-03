// ignore_for_file: file_names

import 'package:example/mediaQuery/size_helpers.dart';
import 'package:example/screens/textfieldDatePicker1.dart';
import 'package:example/screens/textfieldDateTimePicker.dart';
import 'package:example/screens/textfieldTimePicker.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = 'welcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        centerTitle: true,
        title: Text(
          'Welcome to textfield_datepicker',
          style: TextStyle(
            fontSize: displayWidth(context) * 0.050,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(TextFieldDatePickerDemo1.routeName);
              },
              child: const Text('TextField Date Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(TextFieldDateTimePicker.routeName);
              },
              child: const Text('TextField Date Time Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TextFieldTimePicker.routeName);
              },
              child: const Text('TextField Time Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
