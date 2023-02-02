// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/src/utilities/utilities.dart';

class DatePicker {
  DateTime? _selectedDate;
  String? _date;

  Future selectDate({
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    required DateFormat preferredDateFormat,
    required int cupertinoDatePickerMinimumYear,
    required DateTime cupertinoDatePickerMaximumDate,
    required DateTime cupertinoDatePickerMinimumDate,
    required DateTime? cupertinoDateInitialDateTime,
    Color? cupertinoDatePickerBackgroundColor,
    DatePickerDateOrder? cupertinoDateOrder,
    int? cupertinoDatePickerMaximumYear,
    Key? cupertinoDatePickerKey,
    Locale? materialDatePickerLocale,
    bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
  }) async {
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDatePicker(
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
          preferredDateFormat: preferredDateFormat,
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildCupertinoDatePicker(
          context: context,
          preferredDateFormat: preferredDateFormat,
          cupertinoDatePickerMaximumDate: cupertinoDatePickerMaximumDate,
          cupertinoDatePickerMinimumDate: cupertinoDatePickerMinimumDate,
          cupertinoDatePickerBackgroundColor:
              cupertinoDatePickerBackgroundColor,
          cupertinoDatePickerMinimumYear: cupertinoDatePickerMinimumYear,
          cupertinoDatePickerMaximumYear: cupertinoDatePickerMaximumYear,
          key: cupertinoDatePickerKey,
          cupertinoDateInitialDateTime: cupertinoDateInitialDateTime,
          cupertinoDateOrder: cupertinoDateOrder,
        );
    }
  }

  //// This builds material date picker in Android
  Future _buildMaterialDatePicker({
    /// The returned [Future] resolves to the date selected by the user when the user confirms the dialog. If the user cancels the dialog, null is returned.
    required BuildContext context,
    required DateTime materialDatePickerInitialDate,
    required DateTime materialDatePickerFirstDate,
    required DateTime materialDatePickerLastDate,
    required DateFormat preferredDateFormat,
    required Widget Function(BuildContext, Widget?)? materialDatePickerBuilder,
    required DatePickerEntryMode materialDatePickerInitialEntryMode,
    required Locale? materialDatePickerLocale,
    required bool Function(DateTime)? materialDatePickerSelectableDayPredicate,
  }) async {
    ///Shows a dialog containing a Material Design date picker.
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
    _date = preferredDateFormat
        .format(DateTime.parse(_selectedDate.toString().split('T').first));

    if (_date.runtimeType != String) {
      _date = '';
    }

    return _date;
  }

  //// This builds cupertino date picker in iOS
  Future<String?> _buildCupertinoDatePicker({
    required BuildContext context,
    Key? key,
    Color? cupertinoDatePickerBackgroundColor,
    required DateTime? cupertinoDatePickerMaximumDate,
    required DateTime? cupertinoDatePickerMinimumDate,
    required DateFormat preferredDateFormat,
    required int cupertinoDatePickerMinimumYear,
    int? cupertinoDatePickerMaximumYear,
    required DateTime? cupertinoDateInitialDateTime,
    DatePickerDateOrder? cupertinoDateOrder,
  }) async {
    /// ignore: unused_local_variable
    String? picked = await Utils().showSheet(
      context,
      child: SizedBox(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: CupertinoDatePicker(
          dateOrder: cupertinoDateOrder,
          backgroundColor: cupertinoDatePickerBackgroundColor,
          key: key,
          maximumDate: cupertinoDatePickerMaximumDate,
          minimumDate: cupertinoDatePickerMinimumDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (picked) {
            if (picked != _selectedDate) _selectedDate = picked;

            _date = preferredDateFormat.format(
                DateTime.parse(_selectedDate.toString().split('T').first));

            if (_date.runtimeType != String) {
              _date = '';
            }
          },
          initialDateTime: cupertinoDateInitialDateTime,

          ///DateTime.now(),
          minimumYear: cupertinoDatePickerMinimumYear,
          maximumYear: cupertinoDatePickerMaximumYear,
        ),
      ),
      onClicked: () {
        Navigator.of(context).pop();
      },
    );
    return _date;
  }
}
