import 'package:example/screens/textfieldDatePicker.dart';
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
      initialRoute: TextFieldDatePickerDemo.routeName,
      routes: {
        TextFieldDatePickerDemo.routeName: (context) =>
            const TextFieldDatePickerDemo(),
      },
    );
  }
}
