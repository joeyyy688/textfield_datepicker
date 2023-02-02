import 'package:flutter/cupertino.dart';

class Utils {
  Future showSheet(
    BuildContext context, {
    required Widget child,
    required Function() onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: () => onClicked(),
          ),
        ),
      );
}
