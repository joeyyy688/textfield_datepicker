import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class DateAndTimePicker {
  DateTime? selectedDate;
  late DateTime wantedDate = DateTime.now();
  String? dateAndTime;
  DateTime? startDateFromProvider;

  Future selectDate({
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required DateFormat preferredDateFormat,
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
  }) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDateAndTimePicker(
            context,
            materialDatePickerInitialDate,
            materialDatePickerFirstDate,
            materialDatePickerLastDate,
            preferredDateFormat,
            materialDatePickerBuilder,
            materialDatePickerInitialEntryMode,
            materialDatePickerLocale,
            materialDatePickerSelectableDayPredicate);
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDateAndTimePicker(
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
        );
    }
  }

  /// This builds material date picker in Android
  Future buildMaterialDateAndTimePicker(
    BuildContext context,
    DateTime materialDatePickerInitialDate,
    DateTime materialDatePickerFirstDate,
    DateTime materialDatePickerLastDate,
    DateFormat preferredDateFormat,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    DatePickerEntryMode materialDatePickerInitialEntryMode,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
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

    // TimeOfDay timePicked = await showTimePicker(
    //   context: ,
    //   initialTime: ,
    //   builder: ,
    //   initialEntryMode: ,
    //   hourLabelText: ,
    //   minuteLabelText:
    // );

    return dateAndTime;
  }

  /// This builds cupertino date picker in iOS
  Future<String?> buildCupertinoDateAndTimePicker({
    required BuildContext context,
    Key? key,
    Color? cupertinoDatePickerBackgroundColor,
    required DateTime? cupertinoDatePickerMaximumDate,
    required DateTime? cupertinoDatePickerMinimumDate,
    required DateFormat preferredDateFormat,
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

            dateAndTime = preferredDateFormat.format(
                DateTime.parse(selectedDate.toString().split('T').first));

            if (dateAndTime.runtimeType != String) {
              dateAndTime = "";
            }
          },
          initialDateTime: DateTime.now(),
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
