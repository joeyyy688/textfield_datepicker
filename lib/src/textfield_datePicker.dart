library textfield_datepicker;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:textfield_datepicker/src/widget/datePicker.dart';

//A widget(TextfieldDatePicker) that gives you access to both [CupertinoDatePicker] and [showDatePicker] based on the device platform.
//
//Date picked is shown in a Material [TextFormField].
//
//This widget gives you access to most [TextFormField] elements allowing you to design your textfield based on your preference
//
class TextfieldDatePicker extends StatefulWidget {
  //-----------------------Starting from this section...
  //
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
  //
  //-----------------------------------------  ...to the elements on top of this section contains [TextFormField] elements which should be quite familiar to you (if not visit https://api.flutter.dev/flutter/material/TextFormField-class.html for more info)

  // By default the [materialDatePickerInitialEntryMode]  is [DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar]
  //
  //In [calendar] mode, a calendar grid is displayed and the user taps the day they wish to select.
  //
  //In [input] mode a TextField] is displayed and the user types in the date they wish to select.
  //
  //[calendarOnly] and [inputOnly] are variants of the above that don't allow the user to change to the mode.
  //
  final DatePickerEntryMode materialDatePickerInitialEntryMode;

  //The [materialDatePickerFirstDate] is the earliest allowable date.
  //
  final DateTime materialDatePickerFirstDate;

  // When the date picker is first displayed, it will show the month of [materialDatePickerInitialDate], with [materialDatePickerInitialDate] selected.
  //
  final DateTime materialDatePickerInitialDate;

  //The [materialDatePickerLastDate] is the latest allowable date.
  //
  //[materialDatePickerInitialDate] must either fall between these dates([materialDatePickerFirstDate] and [materialDatePickerLastDate]), or be equal to one of them.
  //For each of these DateTime parameters, only their dates are considered.
  //Their time fields are ignored. They must all be non-null.
  //
  final DateTime materialDatePickerLastDate;

  //[preferredDateFormat] is for formatting and parsing dates in a locale-sensitive manner.
  // For more info. on DateFormat visit -- https://api.flutter.dev/flutter/intl/DateFormat-class.html
  //
  final intl.DateFormat preferredDateFormat;

  //The builder parameter can be used to wrap the dialog widget to add inherited widgets like Theme.(for more info. on applying theme visit -- https://api.flutter.dev/flutter/material/Theme-class.html)
  //
  final Widget Function(BuildContext, Widget?)? materialDatePickerBuilder;

  //An optional locale argument can be used to set the locale for the date picker. It defaults to the ambient locale provided by Localizations. visit -- https://api.flutter.dev/flutter/widgets/Localizations-class.html for more info. on localization
  //
  final Locale? materialDatePickerLocale;

  //An optional [materialDatePickerSelectableDayPredicate] function can be passed in to only allow certain days for selection.
  //
  //If provided, only the days that [materialDatePickerSelectableDayPredicate] returns true for will be selectable.
  //
  //For example, this can be used to only allow weekdays for selection. If provided, it must return true for [materialDatePickerInitialDate].
  //
  final bool Function(DateTime)? materialDatePickerSelectableDayPredicate;

  //[cupertinoDatePickerMaximumDate] The maximum selectable date that the picker can settle on.
  //
  //When non-null, the user can still scroll the picker to [DateTime]s later than [cupertinoDatePickerMaximumDate], but the [onDateTimeChanged] will not be called on these [DateTime]s.
  //
  //Once let go, the picker will scroll back to [cupertinoDatePickerMaximumDate].
  //
  //Typically [cupertinoDatePickerMaximumDate] needs to be set to a [DateTime] that is on the same date as [initialDateTime].
  //
  //Defaults to null. When set to null, the picker does not impose a limit on the latest [DateTime] the user can select.
  //
  final DateTime cupertinoDatePickerMaximumDate;
  final DateTime cupertinoDatePickerMinimumDate;
  final int cupertinoDatePickerMinimumYear;

  //[cupertinoDatePickerBackgroundColor] Background color of cupertinoDatePicker.
  //
  // Defaults to null, which disables background painting entirely.
  final Color? cupertinoDatePickerBackgroundColor;
  final Key? cupertinoDatePickerKey;
  final int? cupertinoDatePickerMaximumYear;
  final DateTime? cupertinoDateInitialDateTime;

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
    required this.materialDatePickerFirstDate,
    required this.materialDatePickerLastDate,
    required this.materialDatePickerInitialDate,
    required this.preferredDateFormat,
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
  })  : assert(cupertinoDatePickerMinimumYear != 0),
        super(key: key);

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
                materialDatePickerInitialDate:
                    widget.materialDatePickerInitialDate,
                preferredDateFormat: widget.preferredDateFormat,
                materialDatePickerBuilder: widget.materialDatePickerBuilder,
                materialDatePickerLocale: widget.materialDatePickerLocale,
                materialDatePickerSelectableDayPredicate:
                    widget.materialDatePickerSelectableDayPredicate,
                cupertinoDatePickerMaximumDate:
                    widget.cupertinoDatePickerMaximumDate,
                cupertinoDatePickerMinimumDate:
                    widget.cupertinoDatePickerMinimumDate,
                cupertinoDatePickerMinimumYear:
                    widget.cupertinoDatePickerMinimumYear,
                cupertinoDatePickerBackgroundColor:
                    widget.cupertinoDatePickerBackgroundColor,
                cupertinoDatePickerKey: widget.cupertinoDatePickerKey,
                cupertinoDatePickerMaximumYear:
                    widget.cupertinoDatePickerMaximumYear,
                cupertinoDateInitialDateTime:
                    widget.cupertinoDateInitialDateTime)
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
