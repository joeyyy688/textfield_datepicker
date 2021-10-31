import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class DateAndTimePicker {
  DateTime? _selectedDate;
  String? _date, _hour, _minute, _hourTracker, _dateAndTime;
  String _time = '';
  String _period = '';

  Future selectDateAndTime({
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required bool materialTimePickerUse24hrFormat,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    required DateFormat preferredDateFormat,
    required TimeOfDay materialInitialTime,
    required TimePickerEntryMode materialTimePickerInitialEntryMode,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
    required DateTime? cupertinoDateInitialDateTime,
    required DateTime cupertinoDatePickerMaximumDate,
    required DateTime cupertinoDatePickerMinimumDate,
    required int cupertinoTimePickerMinuteInterval,
    required bool cupertinoTimePickerUse24hFormat,
    required int cupertinoDatePickerMinimumYear,
    Color? cupertinoDatePickerBackgroundColor,
    int? cupertinoDatePickerMaximumYear,
    DatePickerDateOrder? cupertinoDateOrder,
    Key? cupertinoDatePickerKey,
  }) async {
    final ThemeData theme = Theme.of(context);
    // Condition to check platform version and render widget
    //
    switch (theme.platform) {
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDateAndTimePicker(
          context: context,
          materialDatePickerBuilder: materialDatePickerBuilder,
          materialDatePickerFirstDate: materialDatePickerFirstDate,
          materialDatePickerInitialDate: materialDatePickerInitialDate,
          materialDatePickerInitialEntryMode:
              materialDatePickerInitialEntryMode,
          materialDatePickerLastDate: materialDatePickerLastDate,
          materialDatePickerLocale: materialDatePickerLocale,
          materialDatePickerSelectableDayPredicate:
              materialDatePickerSelectableDayPredicate,
          materialInitialTime: materialInitialTime,
          materialTimePickerBuilder: materialTimePickerBuilder,
          materialTimePickerInitialEntryMode:
              materialTimePickerInitialEntryMode,
          materialTimePickerUse24hrFormat: materialTimePickerUse24hrFormat,
          preferredDateFormat: preferredDateFormat,
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return _buildCupertinoDateAndTimePicker(
          context: context,
          preferredDateFormat: preferredDateFormat,
          cupertinoDatePickerMaximumDate: cupertinoDatePickerMaximumDate,
          cupertinoDatePickerMinimumDate: cupertinoDatePickerMinimumDate,
          cupertinoDatePickerBackgroundColor:
              cupertinoDatePickerBackgroundColor,
          cupertinoDatePickerMinimumYear: cupertinoDatePickerMinimumYear,
          cupertinoDatePickerMaximumYear: cupertinoDatePickerMaximumYear,
          key: cupertinoDatePickerKey,
          cupertinoTimePickerUse24hFormat: cupertinoTimePickerUse24hFormat,
          cupertinoTimePickerMinuteInterval: cupertinoTimePickerMinuteInterval,
          cupertinoDateInitialDateTime: cupertinoDateInitialDateTime,
          cupertinoDateOrder: cupertinoDateOrder,
        );
    }
  }

  // This builds material date picker in Android
  //
  Future _buildMaterialDateAndTimePicker({
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required bool materialTimePickerUse24hrFormat,
    required DateFormat preferredDateFormat,
    required Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    required Locale? materialDatePickerLocale,
    required bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
    required TimeOfDay materialInitialTime,
    required Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    required TimePickerEntryMode materialTimePickerInitialEntryMode,
  }) async {
    // Calling of [showDatePicker] widget
    //
    DateTime? picked = await showDatePicker(
      builder: materialDatePickerBuilder,
      initialEntryMode: materialDatePickerInitialEntryMode,
      locale: materialDatePickerLocale,
      selectableDayPredicate: materialDatePickerSelectableDayPredicate,
      context: context,
      initialDate: materialDatePickerInitialDate,
      firstDate: materialDatePickerFirstDate,
      lastDate: materialDatePickerLastDate,
    );

    if (picked != null && picked != _selectedDate) _selectedDate = picked;

    if (picked == null) {
      return;
    }

    // Format or parse [_selectedDate] to the [preferredDateFormat]
    //
    _date = preferredDateFormat
        .format(DateTime.parse(_selectedDate.toString().split('T').first));

    if (_date.runtimeType != String) {
      _date = '';
    }

    // Calling of [showTimePicker] widget
    //
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: materialInitialTime,
      builder: materialTimePickerBuilder,
      initialEntryMode: materialTimePickerInitialEntryMode,
    );

    if (timePicked != null) {
      _hour = timePicked.hour.toString();

      //[_hourTracker] is used to keep track of the hour picked
      //This variable is later used to display the time period based on [materialTimePickerUse24hrFormat] value
      //
      _hourTracker = _hour;

      if (!materialTimePickerUse24hrFormat && int.parse(_hour!) > 12) {
        _hour = (int.parse(_hour!) - 12).toString();
      }

      if (!materialTimePickerUse24hrFormat && int.parse(_hourTracker!) >= 12) {
        _period = 'PM';
      } else if (materialTimePickerUse24hrFormat) {
        _period = '';
      } else if (int.parse(_hourTracker!) < 12) {
        _period = 'AM';
      }

      _minute = timePicked.minute.toString();

      _time = _hour! + ':' + _minute!;
    }

    _dateAndTime = _date! + ' ' + _time + ' ' + _period;

    return _dateAndTime;
  }

  // This builds cupertino date picker in iOS
  //
  Future<String?> _buildCupertinoDateAndTimePicker({
    required BuildContext context,
    Key? key,
    Color? cupertinoDatePickerBackgroundColor,
    required DateTime? cupertinoDatePickerMaximumDate,
    required DateTime? cupertinoDatePickerMinimumDate,
    required DateFormat preferredDateFormat,
    required DateTime? cupertinoDateInitialDateTime,
    required int cupertinoDatePickerMinimumYear,
    int? cupertinoDatePickerMaximumYear,
    required int cupertinoTimePickerMinuteInterval,
    required bool cupertinoTimePickerUse24hFormat,
    DatePickerDateOrder? cupertinoDateOrder,
  }) async {
    // ignore: unused_local_variable
    String? picked = await Utils().showSheet(
      context,
      child: Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: CupertinoDatePicker(
          dateOrder: cupertinoDateOrder,
          backgroundColor: cupertinoDatePickerBackgroundColor,
          key: key,
          maximumDate: cupertinoDatePickerMaximumDate,
          minimumDate: cupertinoDatePickerMinimumDate,
          mode: CupertinoDatePickerMode.dateAndTime,
          minuteInterval: cupertinoTimePickerMinuteInterval,
          use24hFormat: cupertinoTimePickerUse24hFormat,
          onDateTimeChanged: (picked) {
            if (picked != _selectedDate) _selectedDate = picked;

            _date = preferredDateFormat.format(
                DateTime.parse(_selectedDate.toString().split('T').first));

            if (_date.runtimeType != String) {
              _date = '';
            }

            _hour = _selectedDate!.hour.toString();

            //[_hourTracker] is used to keep track of the hour picked
            //This variable is later used to display the time period based on [cupertinoDatePickerUse24hFormat] value
            //
            _hourTracker = _hour;

            if (!cupertinoTimePickerUse24hFormat && int.parse(_hour!) > 12) {
              _hour = (int.parse(_hour!) - 12).toString();
            }

            if (!cupertinoTimePickerUse24hFormat &&
                int.parse(_hourTracker!) >= 12) {
              _period = 'PM';
            } else if (cupertinoTimePickerUse24hFormat) {
              _period = '';
            } else if (int.parse(_hourTracker!) < 12) {
              _period = 'AM';
            }

            _minute = _selectedDate!.minute.toString();

            _time = _hour! + ':' + _minute!;

            _dateAndTime = _date! + ' ' + _time + ' ' + _period;
          },
          initialDateTime: DateTime(
              cupertinoDateInitialDateTime!.year,
              cupertinoDateInitialDateTime.month,
              cupertinoDateInitialDateTime.day,
              cupertinoDateInitialDateTime.hour,
              (cupertinoDateInitialDateTime.minute % 5 * 5).toInt()),
          minimumYear: cupertinoDatePickerMinimumYear,
          maximumYear: cupertinoDatePickerMaximumYear,
        ),
      ),
      onClicked: () {
        Navigator.of(context).pop();
      },
    );
    return _dateAndTime;
  }
}
