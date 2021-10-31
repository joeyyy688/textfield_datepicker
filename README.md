# textfield_datepicker

A collection of three flutter widget [TextfieldDatePicker](https://github.com/joeyyy688/textfield_datepicker/blob/master/lib/src/packages/textfield_datePicker.dart), [TextfieldDateAndTimePicker](https://github.com/joeyyy688/textfield_datepicker/blob/master/lib/src/packages/textfield_dateAndTimePicker.dart) and [TextfieldTimePicker](https://github.com/joeyyy688/textfield_datepicker/blob/master/lib/src/packages/textfield_timePicker.dart).
These widgets gives you access to the various platform date and time pickers based on your device platform. 

The date or time picked is shown in a Material TextFormField widget. 
These three widgets earlier mentioned gives you access to most of Material TextFormField parameters allowing you to design your textfield based on your preference

## Screenshots of how it work




*See [example](https://github.com/joeyyy688/textfield_datepicker/tree/master/example) for details of how this package works*

## Installation
#

Add the textfield_datepicker package to your `pubspec.yml` file.

```yml
dependencies:
  textfield_datepicker: ^0.0.1
```

Import the package into your dart file

```dart
import 'package:textfield_datepicker/textfield_datepicker.dart';
```

```dart
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
```

```dart
import 'package:textfield_datepicker/textfield_timePicker.dart';
```

## Usage
#
### TextfieldDatePicker

| Property | Default | Description | |
|---|---|---|---|
|`materialDatePickerInitialEntryMode`|`DatePickerEntryMode.calendar`| In `DatePickerEntryMode.calendar` mode, a calendar grid is displayed and the user taps the day they wish to select. In `DatePickerEntryMode.input` mode a TextField is displayed and the user types in the date they wish to select..|
|`materialDatePickerFirstDate`|`required`| The earliest allowable date.|
|`materialDatePickerInitialDate`|`required`| When the date picker is first displayed, it will show the month of `materialDatePickerInitialDate`, with `materialDatePickerInitialDate` selected.
  |

```dart
            TextfieldDatePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: DateTime.now().year,
              cupertinoDatePickerMinimumDate: DateTime.now(),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat('dd-MMMM-' 'yyyy'),
              textfieldDatePickerController: _controller,
              style: TextStyle(
                fontSize: displayWidth(context) * 0.040,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                helperStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.031,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, 
                    width: 0),
                    borderRadius: BorderRadius.circular(2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Colors.white,
                    )),
                hintText: "Select Date",
                hintStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
```

### TextfieldDateAndTimePicker
```dart
            TextfieldDateAndTimePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat.yMMMEd(),
              materialTimePickerUse24hrFormat: false,
              cupertinoTimePickerMinuteInterval: 1,
              cupertinoTimePickerUse24hFormat: false,
              textfieldDateAndTimePickerController: _controller,
              style: TextStyle(
                fontSize: displayWidth(context) * 0.040,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                helperStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.031,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, 
                    width: 0),
                    borderRadius: BorderRadius.circular(2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Colors.white,
                    )),
                hintText: "Select Date",
                hintStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              materialInitialTime: TimeOfDay.now(),
            ),
```

### TextfieldTimePicker

```dart
            TextfieldTimePicker(
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDateInitialDateTime: DateTime.now(),
              materialTimePickerUse24hrFormat: false,
              cupertinoTimePickerMinuteInterval: 1,
              cupertinoTimePickerUse24hFormat: false,
              textfieldDateAndTimePickerController: _controller,
              style: TextStyle(
                fontSize: displayWidth(context) * 0.040,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                //errorText: errorTextValue,
                helperStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.031,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, 
                    width: 0),
                    borderRadius: BorderRadius.circular(2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Colors.white,
                    )),
                hintText: "Select Time",
                hintStyle: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              materialInitialTime: TimeOfDay.now(),
            ),
```

## Example

*See the [example](https://github.com/joeyyy688/textfield_datepicker/tree/master/example) for a complete sample app using the various widgets from textfield_datepicker*

### Found an issue or have a suggestion?
<a href="https://github.com/joeyyy688/textfield_datepicker/issues/new/choose" target="_blank"> Create an issue</a>

### Contact
Reach me on Twitter <a href="https://twitter.com/edinjoey" target="_blank">@edinjoey</a>