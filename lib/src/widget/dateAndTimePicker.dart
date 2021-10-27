import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class DateAndTimePicker {
  DateTime? selectedDate;
  late DateTime wantedDate = DateTime.now();
  String? date;
  DateTime? startDateFromProvider;
  String selectedTime = '';
  String? _hour, _minute, _time, _hourTracker, period;
  String? dateAndTime;

  Future selectDateAndTime({
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required bool materialTimePickerUse24hrFormat,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    required DateFormat preferredDateFormat,
    required TimeOfDay materialInitialTime,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    TimePickerEntryMode materialTimePickerInitialEntryMode =
        TimePickerEntryMode.dial,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
    required DateTime? cupertinoDateInitialDateTime,
    required DateTime cupertinoDatePickerMaximumDate,
    required DateTime cupertinoDatePickerMinimumDate,
    Color? cupertinoDatePickerBackgroundColor,
    int cupertinoDatePickerMinimumYear = 1,
    int? cupertinoDatePickerMaximumYear,
    Key? cupertinoDatePickerKey,
    bool cupertinoDatePickerUse24hFormat = false,
    int cupertinoDatePickerminuteInterval = 0,
    bool capitalizePeriod = false,
  }) async {
    final ThemeData theme = Theme.of(context);
// Condition to check platform version and render widget
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
          capitalizePeriod: capitalizePeriod,
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
          cupertinoDatePickerUse24hFormat: cupertinoDatePickerUse24hFormat,
          cupertinoDatePickerminuteInterval: cupertinoDatePickerminuteInterval,
          cupertinoDateInitialDateTime: cupertinoDateInitialDateTime,
          capitalizePeriod: capitalizePeriod,
        );
    }
  }

  /// This builds material date picker in Android
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
    required TimePickerEntryMode
        materialTimePickerInitialEntryMode, //= TimePickerEntryMode.dial
    required bool capitalizePeriod,
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

    if (picked != null && picked != selectedDate) selectedDate = picked;

    if (picked == null) {
      return;
    }

// Format or parse [selectedDate] to the [preferredDateFormat]
//
    date = preferredDateFormat
        .format(DateTime.parse(selectedDate.toString().split('T').first));

    if (date.runtimeType != String) {
      date = "";
    }

    //return [date, DateTime.parse(selectedDate!.toIso8601String())];

// Calling of [showTimePicker] widget
//
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: materialInitialTime,
      builder: materialTimePickerBuilder,
      initialEntryMode: materialTimePickerInitialEntryMode,
    );

    // print(timePicked.);

    if (timePicked != null) {
      _hour = timePicked.hour.toString();
//
      _hourTracker = _hour;

      //print(_hourTracker);

      if (!materialTimePickerUse24hrFormat && int.parse(_hour!) > 12) {
        _hour = (int.parse(_hour!) - 12).toString();
      }

      _minute = timePicked.minute.toString();

      //make sure to add a parameter to either capitalize the period
      if (!materialTimePickerUse24hrFormat && int.parse(_hourTracker!) >= 12) {
        period = 'PM';
      } else if (materialTimePickerUse24hrFormat) {
        period = '';
      } else if (int.parse(_hourTracker!) < 12) {
        period = 'AM';
      }

      _time = _hour! + ':' + _minute!;
      selectedTime = _time!;
    }

    if (!capitalizePeriod && period!.isNotEmpty) {
      period!.toLowerCase();
    }

    dateAndTime = date! + ' ' + selectedTime + ' ' + period!;

    return dateAndTime;
  }

  /// This builds cupertino date picker in iOS
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
    required int cupertinoDatePickerminuteInterval,
    required bool cupertinoDatePickerUse24hFormat,
    required bool capitalizePeriod,
  }) async {
    // ignore: unused_local_variable
    String? picked = await Utils().showSheet(
      context,
      child: Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: CupertinoDatePicker(
          backgroundColor: cupertinoDatePickerBackgroundColor,
          key: key,
          maximumDate: cupertinoDatePickerMaximumDate,
          minimumDate: cupertinoDatePickerMinimumDate,
          mode: CupertinoDatePickerMode.dateAndTime,
          minuteInterval: cupertinoDatePickerminuteInterval,
          use24hFormat: cupertinoDatePickerUse24hFormat,
          onDateTimeChanged: (picked) {
            if (picked != selectedDate) selectedDate = picked;

            _hour = selectedDate!.hour.toString();
            _hourTracker = _hour;

            print(_hourTracker);

            if (!cupertinoDatePickerUse24hFormat && int.parse(_hour!) > 12) {
              _hour = (int.parse(_hour!) - 12).toString();
            }

            _minute = selectedDate!.minute.toString();

            //make sure to add a parameter to either capitalize the period
            if (!cupertinoDatePickerUse24hFormat &&
                int.parse(_hourTracker!) >= 12) {
              period = 'PM';
            } else if (cupertinoDatePickerUse24hFormat) {
              period = '';
            } else if (int.parse(_hourTracker!) < 12) {
              period = 'AM';
            }
            _time = _hour! + ':' + _minute!;
            selectedTime = _time!;

            date = preferredDateFormat.format(
                DateTime.parse(selectedDate.toString().split('T').first));

            if (date.runtimeType != String) {
              date = "";
            }

            if (!capitalizePeriod && period!.isNotEmpty) {
              period!.toLowerCase();
            }

            dateAndTime = date! + ' ' + selectedTime + ' ' + period!;

            print(date);
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
      onClicked: (date) {
        Navigator.of(context).pop();
        print(date);
        //return date;
      },
      value: dateAndTime,
    );
    return dateAndTime;
  }
}
