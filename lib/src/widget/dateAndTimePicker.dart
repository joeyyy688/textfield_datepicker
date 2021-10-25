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
    required DateFormat preferredDateFormat,
    required DateTime? cupertinoDateInitialDateTime,
    required DateTime cupertinoDatePickerMaximumDate,
    required DateTime cupertinoDatePickerMinimumDate,
    Color? cupertinoDatePickerBackgroundColor,
    //bool? cupertinoDatePickerUse24hFormat,
    //int? cupertinoDatePickerminuteInterval,
    int cupertinoDatePickerMinimumYear = 1,
    int? cupertinoDatePickerMaximumYear,
    Key? cupertinoDatePickerKey,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
    bool cupertinoDatePickerUse24hFormat = false,
    int cupertinoDatePickerminuteInterval = 0,
    required TimeOfDay materialInitialTime,
    Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    TimePickerEntryMode materialTimePickerInitialEntryMode =
        TimePickerEntryMode.dial,
  }) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDateAndTimePicker(
          context,
          materialDatePickerInitialDate,
          materialDatePickerFirstDate,
          materialDatePickerLastDate,
          materialTimePickerUse24hrFormat,
          preferredDateFormat,
          materialDatePickerBuilder,
          materialDatePickerInitialEntryMode,
          materialDatePickerLocale,
          materialDatePickerSelectableDayPredicate,
          materialInitialTime,
          materialTimePickerBuilder,
          materialTimePickerInitialEntryMode,
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
            cupertinoDatePickerminuteInterval:
                cupertinoDatePickerminuteInterval,
            cupertinoDateInitialDateTime: cupertinoDateInitialDateTime);
    }
  }

  /// This builds material date picker in Android
  Future _buildMaterialDateAndTimePicker(
    BuildContext context,
    DateTime materialDatePickerInitialDate,
    DateTime materialDatePickerFirstDate,
    DateTime materialDatePickerLastDate,
    bool materialTimePickerUse24hrFormat,
    DateFormat preferredDateFormat,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    DatePickerEntryMode materialDatePickerInitialEntryMode,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
    TimeOfDay materialInitialTime,
    Widget Function(BuildContext, Widget?)? materialTimePickerBuilder,
    TimePickerEntryMode
        materialTimePickerInitialEntryMode, //= TimePickerEntryMode.dial
  ) async {
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
    date = preferredDateFormat
        .format(DateTime.parse(selectedDate.toString().split('T').first));

    if (date.runtimeType != String) {
      date = "";
    }

    //return [date, DateTime.parse(selectedDate!.toIso8601String())];

    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: materialInitialTime,
      builder: materialTimePickerBuilder,
      initialEntryMode: materialTimePickerInitialEntryMode,
    );

    // print(timePicked.);

    if (timePicked != null) {
      _hour = timePicked.hour.toString();
      _hourTracker = _hour;

      print(_hourTracker);

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
    int cupertinoDatePickerMinimumYear = 1,
    int? cupertinoDatePickerMaximumYear,
    int cupertinoDatePickerminuteInterval = 0,
    bool cupertinoDatePickerUse24hFormat = false,
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
