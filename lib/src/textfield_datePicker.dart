import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:textfield_datepicker/src/datePicker.dart';

class TextfieldDatePicker extends StatefulWidget {
  final TextEditingController textfieldDatePickerController;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final bool enableSuggestions;
  final bool enableInteractiveSelection;
  final bool expands;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final DatePickerEntryMode materialDatePickerInitialEntryMode;
  final DateTime materialDatePickerLastDate;
  final DateTime materialDatePickerFirstDate;
  final DateTime materialDatePickerInitialDate;
  final intl.DateFormat preferredDateFormat;
  final Widget Function(BuildContext, Widget?)? materialDatePickerBuilder;
  final Locale? materialDatePickerLocale;
  final bool Function(DateTime)? materialDatePickerSelectableDayPredicate;
  final DateTime cupertinoDatePickerMaximumDate;
  final DateTime cupertinoDatePickerMinimumDate;
  final int? cupertinoDatePickerMinimum;
  final Color? cupertinoDatePickerBackgroundColor;
  final Key? cupertinoDatePickerKey;
  final int? cupertinoDatePickerMaximumYear;
  final bool? cupertinoDatePickerUse24hFormat;
  final int? cupertinoDatePickerminuteInterval;
  final Color? cupertinoModalsheetColor;

  TextfieldDatePicker({
    Key? key,
    required this.textfieldDatePickerController,
    this.autofillHints,
    this.autovalidateMode,
    this.decoration = const InputDecoration(),
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.expands = false,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.cursorColor = Colors.black,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.left,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlignVertical,
    this.textDirection,
    this.textInputAction,
    this.focusNode,
    this.materialDatePickerInitialEntryMode = DatePickerEntryMode.calendar,
    required this.materialDatePickerLastDate,
    required this.materialDatePickerFirstDate,
    required this.materialDatePickerInitialDate,
    required this.preferredDateFormat,
    this.materialDatePickerBuilder,
    this.materialDatePickerLocale,
    this.materialDatePickerSelectableDayPredicate,
    required this.cupertinoDatePickerMaximumDate,
    required this.cupertinoDatePickerMinimumDate,
    required this.cupertinoDatePickerMinimum,
    required this.cupertinoDatePickerBackgroundColor,
    this.cupertinoDatePickerKey,
    required this.cupertinoDatePickerMaximumYear,
    required this.cupertinoDatePickerUse24hFormat,
    this.cupertinoDatePickerminuteInterval,
    required this.cupertinoModalsheetColor,
  }) : super(key: key);

  @override
  _TextfieldDatePickerState createState() => _TextfieldDatePickerState();
}

class _TextfieldDatePickerState extends State<TextfieldDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      showCursor: false,
      readOnly: true,
      onTap: () {
        DatePicker()
            .selectDate(
          context: context,
          materialDatePickerLastDate: widget.materialDatePickerLastDate,
          materialDatePickerInitialEntryMode:
              widget.materialDatePickerInitialEntryMode,
          materialDatePickerFirstDate: widget.materialDatePickerFirstDate,
          materialDatePickerInitialDate: widget.materialDatePickerInitialDate,
          preferredDateFormat: widget.preferredDateFormat,
          materialDatePickerBuilder: widget.materialDatePickerBuilder,
          materialDatePickerLocale: widget.materialDatePickerLocale,
          materialDatePickerSelectableDayPredicate:
              widget.materialDatePickerSelectableDayPredicate,
          cupertinoDatePickerMaximumDate: widget.cupertinoDatePickerMaximumDate,
          cupertinoDatePickerMinimumDate: widget.cupertinoDatePickerMinimumDate,
          cupertinoDatePickerMinimum: widget.cupertinoDatePickerMinimum,
          cupertinoDatePickerBackgroundColor:
              widget.cupertinoDatePickerBackgroundColor,
          cupertinoDatePickerKey: widget.cupertinoDatePickerKey,
          cupertinoDatePickerMaximumYear: widget.cupertinoDatePickerMaximumYear,
          cupertinoDatePickerUse24hFormat:
              widget.cupertinoDatePickerUse24hFormat,
          cupertinoDatePickerminuteInterval:
              widget.cupertinoDatePickerminuteInterval,
          cupertinoModalsheetColor: widget.cupertinoModalsheetColor,
        )
            .then((value) {
          if (value == null) {
            return;
          } else {
            setState(() {
              widget.textfieldDatePickerController.text =
                  value == null ? "" : value;
            });
          }
        });
      },
      focusNode: widget.focusNode,
      autovalidateMode: widget.autovalidateMode,
      decoration: widget.decoration,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      expands: widget.expands,
      enableSuggestions: widget.enableSuggestions,
      autofillHints: widget.autofillHints,
      controller: widget.textfieldDatePickerController,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorColor: widget.cursorColor,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onSaved: widget.onSaved,
      validator: widget.validator,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      textInputAction: widget.textInputAction,
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: false, selectAll: true),
      enabled: true,
      autofocus: false,
      keyboardType: null,
    );
  }
}
