import 'package:example/screens/textfieldDatePicker1.dart';
import 'package:example/screens/textfieldDatePicker2.dart';
import 'package:example/screens/textfieldDateTimePicker.dart';
import 'package:example/screens/welcomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textfield Date Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomePage.routeName,
      routes: {
        TextFieldDatePickerDemo1.routeName: (context) =>
            const TextFieldDatePickerDemo1(),
        TextFieldDatePicker2.routeName: (context) =>
            const TextFieldDatePicker2(),
        WelcomePage.routeName: (context) => const WelcomePage(),
        TextFieldDateTimePicker.routeName: (context) =>
            const TextFieldDateTimePicker(),
      },
    );
  }
}
