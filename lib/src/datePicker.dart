import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  DateTime? selectedDate;
  late DateTime wantedDate = DateTime.now();
  String? date;
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
    bool? cupertinoDatePickerUse24hFormat,
    int? cupertinoDatePickerminuteInterval,
    int? cupertinoDatePickerMinimum,
    int? cupertinoDatePickerMaximumYear,
    Key? cupertinoDatePickerKey,
    Color? cupertinoModalsheetColor,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
  }) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(
            context,
            materialDatePickerInitialDate,
            materialDatePickerFirstDate,
            materialDatePickerLastDate,
            preferredDateFormat,
            materialDatePickerBuilder,
            materialDatePickerInitialEntryMode,
            materialDatePickerLocale,
            materialDatePickerSelectableDayPredicate);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(
          context: context,
          preferredDateFormat: preferredDateFormat,
          cupertinoDatePickerMaximumDate: cupertinoDatePickerMaximumDate,
          cupertinoDatePickerMinimumDate: cupertinoDatePickerMinimumDate,
          cupertinoDatePickerBackgroundColor:
              cupertinoDatePickerBackgroundColor,
          cupertinoDatePickerUse24hFormat: cupertinoDatePickerUse24hFormat,
          cupertinoDatePickerminuteInterval: cupertinoDatePickerminuteInterval,
          cupertinoModalsheetColor: cupertinoModalsheetColor,
          cupertinoDatePickerMinimum: cupertinoDatePickerMinimum,
          cupertinoDatePickerMaximumYear: cupertinoDatePickerMaximumYear,
          key: cupertinoDatePickerKey,
        );
    }
  }

  /// This builds material date picker in Android
  Future buildMaterialDatePicker(
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
    date = preferredDateFormat
        .format(DateTime.parse(selectedDate.toString().split('T').first));

    if (date.runtimeType != String) {
      date = "";
    }

    //return [date, DateTime.parse(selectedDate!.toIso8601String())];
    return date;
  }

  /// This builds cupertino date picker in iOS
  Future buildCupertinoDatePicker({
    required BuildContext context,
    Key? key,
    Color? cupertinoDatePickerBackgroundColor,
    required DateTime? cupertinoDatePickerMaximumDate,
    required DateTime? cupertinoDatePickerMinimumDate,
    required DateFormat preferredDateFormat,
    int? cupertinoDatePickerminuteInterval,
    bool? cupertinoDatePickerUse24hFormat,
    int? cupertinoDatePickerMinimum,
    int? cupertinoDatePickerMaximumYear,
    Color? cupertinoModalsheetColor,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: cupertinoModalsheetColor == null
              ? Colors.white
              : cupertinoModalsheetColor,
          child: CupertinoDatePicker(
            backgroundColor: cupertinoDatePickerBackgroundColor,
            key: key,
            maximumDate: cupertinoDatePickerMaximumDate,
            minimumDate: cupertinoDatePickerMinimumDate,
            mode: CupertinoDatePickerMode.date,
            minuteInterval: cupertinoDatePickerminuteInterval == null
                ? 1
                : cupertinoDatePickerminuteInterval,
            use24hFormat: cupertinoDatePickerUse24hFormat == null
                ? false
                : cupertinoDatePickerUse24hFormat,
            onDateTimeChanged: (picked) {
              if (picked != selectedDate) selectedDate = picked;

              date = preferredDateFormat.format(
                  DateTime.parse(selectedDate.toString().split('T').first));

              if (date.runtimeType != String) {
                date = "";
              }
            },
            initialDateTime: DateTime.now(),
            minimumYear: cupertinoDatePickerMinimum == null
                ? 1
                : cupertinoDatePickerMinimum,
            maximumYear: cupertinoDatePickerMaximumYear,
          ),
        );
      },
    ).whenComplete(() {
      return date;
    });
  }
}
