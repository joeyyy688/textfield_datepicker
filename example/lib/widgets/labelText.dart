// ignore_for_file: file_names

import 'package:example/mediaQuery/size_helpers.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelValue;

  const LabelText({Key? key, required this.labelValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          labelValue,
          style: TextStyle(
              fontSize: displayWidth(context) * 0.038,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
