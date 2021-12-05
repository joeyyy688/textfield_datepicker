import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class TimePicker {
  DateTime? _selectedDate;
  String _selectedTime = '';
  String? _hour, _minute, _hourTracker;
  String _period = '';
  String _time = '';

  Future selectTime({
    required BuildContext context,
    required bool materialTimePickerUse24hrFormat,
    required TimeOfDay materialInitialTime,
    required TimePickerEntryMode materialTimePickerInitialEntryMode,
    Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    required DateTime? cupertinoDateInitialDateTime,
    required int cupertinoTimePickerMinuteInterval,
    required bool cupertinoTimePickerUse24hFormat,
    Color? cupertinoDatePickerBackgroundColor,
    Key? cupertinoTimePickerKey,
  }) async {
    final ThemeData theme = Theme.of(context);

    /// Condition to check platform version and render widget
    ///
    switch (theme.platform) {
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.android:
        return _buildMaterialTimePicker(
          context: context,
          materialInitialTime: materialInitialTime,
          materialTimePickerBuilder: materialTimePickerBuilder,
          materialTimePickerInitialEntryMode:
              materialTimePickerInitialEntryMode,
          materialTimePickerUse24hrFormat: materialTimePickerUse24hrFormat,
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildCupertinoTimePicker(
          context: context,
          cupertinoDatePickerBackgroundColor:
              cupertinoDatePickerBackgroundColor,
          key: cupertinoTimePickerKey,
          cupertinoTimePickerUse24hFormat: cupertinoTimePickerUse24hFormat,
          cupertinoTimePickerMinuteInterval: cupertinoTimePickerMinuteInterval,
          cupertinoDateInitialDateTime: cupertinoDateInitialDateTime,
        );
    }
  }

  /// This builds material date picker in Android
  ///
  Future _buildMaterialTimePicker({
    required BuildContext context,
    required bool materialTimePickerUse24hrFormat,
    required TimeOfDay materialInitialTime,
    required Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    required TimePickerEntryMode materialTimePickerInitialEntryMode,
  }) async {
    /// Calling of [showTimePicker] widget
    ///
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: materialInitialTime,
      builder: materialTimePickerBuilder,
      initialEntryMode: materialTimePickerInitialEntryMode,
    );

    /// Condition to check if time is picked or not
    if (timePicked != null) {
      _hour = timePicked.hour.toString().padLeft(2, '0');

      ///[_hourTracker] is used to keep track of the hour picked
      ///This variable is later used to display the time period based on [materialTimePickerUse24hrFormat] value
      ///
      _hourTracker = _hour;

      if (!materialTimePickerUse24hrFormat && int.parse(_hour!) > 12) {
        _hour = (int.parse(_hour!) - 12).toString();
      } else if (!materialTimePickerUse24hrFormat && int.parse(_hour!) == 0) {
        _hour = (int.parse(_hour!) + 12).toString();
      }

      if (!materialTimePickerUse24hrFormat && int.parse(_hourTracker!) >= 12) {
        _period = 'PM';
      } else if (materialTimePickerUse24hrFormat) {
        _period = '';
      } else if (int.parse(_hourTracker!) < 12) {
        _period = 'AM';
      }

      _minute = timePicked.minute.toString().padLeft(2, '0');

      _selectedTime = _hour! + ':' + _minute!;
    }

    _time = _selectedTime + ' ' + _period;

    return _time;
  }

  /// This builds cupertino date picker in iOS
  ///
  Future<String?> _buildCupertinoTimePicker({
    required BuildContext context,
    Key? key,
    Color? cupertinoDatePickerBackgroundColor,
    required DateTime? cupertinoDateInitialDateTime,
    required int cupertinoTimePickerMinuteInterval,
    required bool cupertinoTimePickerUse24hFormat,
  }) async {
    /// ignore: unused_local_variable
    String? picked = await Utils().showSheet(
      context,
      child: Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: CupertinoDatePicker(
          backgroundColor: cupertinoDatePickerBackgroundColor,
          key: key,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: cupertinoTimePickerMinuteInterval,
          use24hFormat: cupertinoTimePickerUse24hFormat,
          onDateTimeChanged: (picked) {
            if (picked != _selectedDate) _selectedDate = picked;

            _hour = _selectedDate!.hour.toString().padLeft(2, '0');

            ///[_hourTracker] is used to keep track of the hour picked
            ///This variable is later used to display the time period based on [cupertinoDatePickerUse24hFormat] value
            ///
            _hourTracker = _hour;

            if (!cupertinoTimePickerUse24hFormat && int.parse(_hour!) > 12) {
              _hour = (int.parse(_hour!) - 12).toString();
            } else if (!cupertinoTimePickerUse24hFormat &&
                int.parse(_hour!) == 0) {
              _hour = (int.parse(_hour!) + 12).toString();
            }

            if (!cupertinoTimePickerUse24hFormat &&
                int.parse(_hourTracker!) >= 12) {
              _period = 'PM';
            } else if (cupertinoTimePickerUse24hFormat) {
              _period = '';
            } else if (int.parse(_hourTracker!) < 12) {
              _period = 'AM';
            }

            _minute = _selectedDate!.minute.toString().padLeft(2, '0');

            _selectedTime = _hour! + ':' + _minute!;

            _time = _selectedTime + ' ' + _period;
          },
          initialDateTime: DateTime(
              cupertinoDateInitialDateTime!.year,
              cupertinoDateInitialDateTime.month,
              cupertinoDateInitialDateTime.day,
              cupertinoDateInitialDateTime.hour,
              (cupertinoDateInitialDateTime.minute % 5 * 5).toInt()),
        ),
      ),
      onClicked: () {
        Navigator.of(context).pop();
      },
    );
    return _time;
  }
}
