// ignore_for_file: file_names, library_private_types_in_public_api

library textfield_datepicker;

import 'package:flutter/material.dart';

import 'package:textfield_datepicker/src/widgets/time_picker.dart';

///A widget(TextfieldTimePicker) that gives access to both [CupertinoDatePicker] and [showTimePicker] based on the device platform.
///
///Time picked is shown in a Material [TextFormField].
///
///This widget gives access to most [TextFormField] parameters allowing you to design your textfield based on your preference
///
class TextfieldTimePicker extends StatefulWidget {
  ///-----------------------Starting from this section...
  ///
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

  ///
  ///-----------------------------------------  ...to the elements on top of this section contains [TextFormField] elements which should be quite familiar to you (if not visit http://api.flutter.dev/flutter/material/TextFormField-class.html for more info)

  ///When the time picker is first displayed, it will have [materialInitialTime], as the time selected.
  ///
  final TimeOfDay materialInitialTime;

  ///By default [materialTimePickerUse24hrFormat] is false.
  ///
  final bool materialTimePickerUse24hrFormat;

  ///The [materialTimePickerInitialEntryMode] parameter can be used to determine the initial time entry selection of the picker (either a clock dial or text input).
  ///
  final TimePickerEntryMode materialTimePickerInitialEntryMode;

  ///The [materialTimePickerBuilder] parameter can be used to wrap the dialog widget to add inherited widgets like Localizations.override, Directionality, or MediaQuery.
  ///
  final Widget Function(BuildContext, Widget?)? materialTimePickerBuilder;

  ///[cupertinoDatePickerBackgroundColor] Background color of cupertinoDatePicker.
  ///
  /// Defaults to null, which disables background painting entirely.
  ///
  final Color? cupertinoDatePickerBackgroundColor;

  ///A [cupertinoDatePickerKey] is an identifier for [CupertinoDatePicker Widgets, Elements, and SemanticsNodes].
  ///
  final Key? cupertinoDatePickerKey;

  ///The [cupertinoDateInitialDateTime] initial date and/or time of the picker.
  ///Defaults to the present date and time and must not be null.
  ///The present must conform to the intervals set in [cupertinoDatePickerMinimumDate], [cupertinoDatePickerMaximumDate], [cupertinoDatePickerMinimumYear], and [cupertinoDatePickerMaximumYear].
  ///
  final DateTime? cupertinoDateInitialDateTime;

  ///By default [cupertinoTimePickerUse24hFormat] is false.
  ///
  final bool cupertinoTimePickerUse24hFormat;

  ///The granularity of the minutes spinner, if it is shown in the current mode. Must be an integer factor of 60
  ///
  final int cupertinoTimePickerMinuteInterval;

  ///[textfieldTimePickerWidth] gives you the option to adjust the width of the [TextfieldTimePicker]
  ///[textfieldTimePickerWidth] defaults to 84, which is 84 percent of the available screen width
  ///
  final num textfieldTimePickerWidth;

  ///[textfieldTimePickerMargin] allows you to add some margin to the [TextfieldTimePicker].
  ///By default it has a preset value of [const EdgeInsets.symmetric(vertical: 10, horizontal: 0)], but can be adjusted based on preference/choice.
  ///
  final EdgeInsetsGeometry? textfieldTimePickerMargin;

  ///[textfieldTimePickerPadding] allows you to add some padding to the [TextfieldTimePicker], quite similar to [textfieldTimePickerMargin].
  ///Again, by default a preset value of [const EdgeInsets.symmetric(horizontal: 5, vertical: 0)], but can be modified based on preference/choice.
  ///
  final EdgeInsetsGeometry? textfieldTimePickerPadding;

  const TextfieldTimePicker({
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
    this.materialTimePickerUse24hrFormat = false,
    required this.cupertinoDatePickerBackgroundColor,
    this.cupertinoDatePickerKey,
    required this.cupertinoDateInitialDateTime,
    this.textfieldTimePickerWidth = 84,
    this.textfieldTimePickerMargin =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    this.textfieldTimePickerPadding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    required this.materialInitialTime,
    this.materialTimePickerBuilder,
    this.materialTimePickerInitialEntryMode = TimePickerEntryMode.dial,
    this.cupertinoTimePickerUse24hFormat = false,
    this.cupertinoTimePickerMinuteInterval = 0,
  }) : super(key: key);

  @override
  _TextfieldTimePickerState createState() => _TextfieldTimePickerState();
}

class _TextfieldTimePickerState extends State<TextfieldTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          (widget.textfieldTimePickerWidth / 100),
      margin: widget.textfieldTimePickerMargin,
      padding: widget.textfieldTimePickerPadding,
      child: TextFormField(
        key: widget.key,
        showCursor: false,
        readOnly: true,
        onTap: () {
          ////Call the DateTime Picker Method
          TimePicker()
              .selectTime(
            context: context,
            materialInitialTime: widget.materialInitialTime,
            materialTimePickerUse24hrFormat:
                widget.materialTimePickerUse24hrFormat,
            materialTimePickerBuilder: widget.materialTimePickerBuilder,
            materialTimePickerInitialEntryMode:
                widget.materialTimePickerInitialEntryMode,
            cupertinoDatePickerBackgroundColor:
                widget.cupertinoDatePickerBackgroundColor,
            cupertinoTimePickerKey: widget.cupertinoDatePickerKey,
            cupertinoTimePickerUse24hFormat:
                widget.cupertinoTimePickerUse24hFormat,
            cupertinoTimePickerMinuteInterval:
                widget.cupertinoTimePickerMinuteInterval,
            cupertinoDateInitialDateTime: widget.cupertinoDateInitialDateTime,
          )
              .then((value) {
            if (value == null) {
              return;
            } else {
              setState(() {
                widget.textfieldDateAndTimePickerController.text = value ?? '';
              });
            }

            ///DateTime.parse(value!.toIso8601String()); ----- to convert date to this type of format 2021-10-18T09:36:02.068Z. This is because some APIS may not accept the type of Date format you will be passing to [preferredDateFormat]
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
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: false,
          selectAll: true,
        ),
        enabled: true,
        autofocus: false,
        keyboardType: null,
      ),
    );
  }
}
