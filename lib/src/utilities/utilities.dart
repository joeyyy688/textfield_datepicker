import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  Future showSheet(
    BuildContext context, {
    required Widget child,
    required String? Function(String?) onClicked,
    required String? value,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: () => onClicked(value),
          ),
        ),
      );
}
