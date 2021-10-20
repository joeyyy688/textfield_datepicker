library textfield_datepicker;

import 'package:flutter/material.dart';

class TextfieldDateAndTimePicker extends StatefulWidget {
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

  TextfieldDateAndTimePicker({
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
  }) : super(key: key);

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
        toolbarOptions: ToolbarOptions(
            copy: true, cut: true, paste: false, selectAll: true),
        enabled: true,
        autofocus: false,
        keyboardType: null,
      ),
    );
  }
}
