library textfield_datepicker;

import 'package:flutter/material.dart';
import 'package:textfield_datepicker/src/widget/dateAndTimePicker.dart';
import 'package:intl/intl.dart' as intl;

class TextfieldDateAndTimePicker extends StatefulWidget {
  //-----------------------Starting from this section...
  //
  final TextEditingController textfieldDateAndTimePickerController;
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
  //
  //-----------------------------------------  ...to the elements on top of this section contains [TextFormField] elements which should be quite familiar to you (if not visit https://api.flutter.dev/flutter/material/TextFormField-class.html for more info)
  final DateTime materialDatePickerFirstDate;
  final DateTime materialDatePickerLastDate;
  final bool materialTimePickerUse24hrFormat;
  final intl.DateFormat preferredDateFormat;
  final DateTime materialDatePickerInitialDate;
  final Widget Function(BuildContext, Widget?)? materialDatePickerBuilder;
  final Locale? materialDatePickerLocale;
  final bool Function(DateTime)? materialDatePickerSelectableDayPredicate;
  final DateTime cupertinoDatePickerMaximumDate;
  final DateTime cupertinoDatePickerMinimumDate;
  final int cupertinoDatePickerMinimumYear;
  final int? cupertinoDatePickerMaximumYear;
  final Color? cupertinoDatePickerBackgroundColor;
  final Key? cupertinoDatePickerKey;
  final DateTime? cupertinoDateInitialDateTime;
  final num textfieldDatePickerWidth;
  final EdgeInsetsGeometry? textfieldDatePickerMargin;
  final EdgeInsetsGeometry? textfieldDatePickerPadding;
  final DatePickerEntryMode materialDatePickerInitialEntryMode;
  final TimeOfDay materialInitialTime;
  final Widget Function(BuildContext, Widget?)? materialTimePickerBuilder;
  final TimePickerEntryMode materialTimePickerInitialEntryMode;
  final bool cupertinoDatePickerUse24hFormat;
  final int cupertinoDatePickerminuteInterval;

  TextfieldDateAndTimePicker({
    Key? key,
    required this.textfieldDateAndTimePickerController,
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
    required this.materialDatePickerFirstDate,
    required this.materialDatePickerLastDate,
    required this.materialDatePickerInitialDate,
    required this.preferredDateFormat,
    this.materialTimePickerUse24hrFormat = true,
    this.materialDatePickerBuilder,
    this.materialDatePickerLocale,
    this.materialDatePickerSelectableDayPredicate,
    required this.cupertinoDatePickerMaximumDate,
    required this.cupertinoDatePickerMinimumDate,
    this.cupertinoDatePickerMinimumYear = 1,
    required this.cupertinoDatePickerBackgroundColor,
    this.cupertinoDatePickerKey,
    required this.cupertinoDatePickerMaximumYear,
    required this.cupertinoDateInitialDateTime,
    this.textfieldDatePickerWidth = 84,
    this.textfieldDatePickerMargin =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    this.textfieldDatePickerPadding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    required this.materialInitialTime,
    this.materialTimePickerBuilder,
    this.materialTimePickerInitialEntryMode = TimePickerEntryMode.dial,
    this.cupertinoDatePickerUse24hFormat = false,
    this.cupertinoDatePickerminuteInterval = 5,
  })  : assert(cupertinoDatePickerMinimumYear != 0),
        // assert(cupertinoDateInitialDateTime!.minute %
        //         cupertinoDatePickerminuteInterval ==
        //     0),
        super(key: key);

  @override
  _TextfieldDateAndTimePickerState createState() =>
      _TextfieldDateAndTimePickerState();
}

class _TextfieldDateAndTimePickerState
    extends State<TextfieldDateAndTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        key: widget.key,
        showCursor: false,
        readOnly: true,
        onTap: () {
          ///Call the DateTime Picker Method
          DateAndTimePicker()
              .selectDateAndTime(
                  context: context,
                  materialDatePickerFirstDate:
                      widget.materialDatePickerFirstDate,
                  materialDatePickerInitialDate:
                      widget.materialDatePickerInitialDate,
                  materialDatePickerInitialEntryMode:
                      widget.materialDatePickerInitialEntryMode,
                  materialDatePickerLastDate: widget.materialDatePickerLastDate,
                  materialInitialTime: widget.materialInitialTime,
                  materialTimePickerUse24hrFormat:
                      widget.materialTimePickerUse24hrFormat,
                  materialDatePickerBuilder: widget.materialDatePickerBuilder,
                  materialDatePickerLocale: widget.materialDatePickerLocale,
                  materialDatePickerSelectableDayPredicate:
                      widget.materialDatePickerSelectableDayPredicate,
                  materialTimePickerBuilder: widget.materialTimePickerBuilder,
                  materialTimePickerInitialEntryMode:
                      widget.materialTimePickerInitialEntryMode,
                  preferredDateFormat: widget.preferredDateFormat,
                  cupertinoDatePickerMaximumDate:
                      widget.cupertinoDatePickerMaximumDate,
                  cupertinoDatePickerMinimumDate:
                      widget.cupertinoDatePickerMinimumDate,
                  cupertinoDatePickerBackgroundColor:
                      widget.cupertinoDatePickerBackgroundColor,
                  cupertinoDatePickerKey: widget.cupertinoDatePickerKey,
                  cupertinoDatePickerMaximumYear:
                      widget.cupertinoDatePickerMaximumYear,
                  cupertinoDatePickerMinimumYear:
                      widget.cupertinoDatePickerMinimumYear,
                  cupertinoDatePickerUse24hFormat:
                      widget.cupertinoDatePickerUse24hFormat,
                  cupertinoDatePickerminuteInterval:
                      widget.cupertinoDatePickerminuteInterval,
                  cupertinoDateInitialDateTime:
                      widget.cupertinoDateInitialDateTime)
              .then((value) {
            if (value == null) {
              return;
            } else {
              setState(() {
                widget.textfieldDateAndTimePickerController.text =
                    value == null ? "" : value;
              });
            }
            //DateTime.parse(value!.toIso8601String()); ----- to convert date to this type of format 2021-10-18T09:36:02.068Z. This is because some APIS may not accept the type of Date format you will be passing to [preferredDateFormat]
          });
        },
        focusNode: widget.focusNode,
        autovalidateMode: widget.autovalidateMode,
        decoration: widget.decoration,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        expands: widget.expands,
        enableSuggestions: widget.enableSuggestions,
        autofillHints: widget.autofillHints,
        controller: widget.textfieldDateAndTimePickerController,
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
        toolbarOptions: ToolbarOptions(
            copy: true, cut: true, paste: false, selectAll: true),
        enabled: true,
        autofocus: false,
        keyboardType: null,
      ),
    );
  }
}
