import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class DateAndTimePicker {
  DateTime? selectedDate;
  late DateTime wantedDate = DateTime.now();
  String? dateAndTime;
  DateTime? startDateFromProvider;
  String selectedTime = '';

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
      case TargetPlatform.android:
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
    dateAndTime = preferredDateFormat
        .format(DateTime.parse(selectedDate.toString().split('T').first));

    if (dateAndTime.runtimeType != String) {
      dateAndTime = "";
    }

    //return [date, DateTime.parse(selectedDate!.toIso8601String())];
    String? _hour;
    String? _minute;
    String? _time;

    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: materialInitialTime,
      builder: materialTimePickerBuilder,
      initialEntryMode: materialTimePickerInitialEntryMode,
    );

    // print(timePicked.);

    if (timePicked != null) {
      //selectedTime = timePicked;

      // DateTime tempDate = preferredDateFormat.parse(
      //     timePicked.hour.toString() + ":" + timePicked.minute.toString());
      // print("==============>>>>>>> $tempDate");

      _hour = timePicked.hour.toString();
      if (materialTimePickerUse24hrFormat) {
        _hour = (int.parse(_hour) - 12).toString();
      }
      _minute = timePicked.minute.toString();
      _time = _hour + ':' + _minute;
      selectedTime = _time;
    }
    // selectedTime = formatDate(
    //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //     [hh, ':', nn, " ", am]).toString();

    return dateAndTime! + ' ' + selectedTime;
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
    //DateTime initialDateTime = DateTime.now();
    // int initialMinute = cupertinoDateInitialDateTime!.minute;

    // if (cupertinoDateInitialDateTime.minute % 5 != 0) {
    //   initialMinute = cupertinoDateInitialDateTime.minute -
    //       cupertinoDateInitialDateTime.minute % 5 +
    //       5;
    // }
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

            dateAndTime = preferredDateFormat.format(
                DateTime.parse(selectedDate.toString().split('T').first));

            if (dateAndTime.runtimeType != String) {
              dateAndTime = "";
            }
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
        return date;
      },
      value: dateAndTime,
    );
    return dateAndTime;
  }
}
