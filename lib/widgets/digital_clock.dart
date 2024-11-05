import 'dart:async';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// A digital clock widget that displays the current time.
class DigitalClock extends StatefulWidget {
  /// The [TextStyle] of the clock.
  final TextStyle? textStyle;

  /// The [AlignmentGeometry] of the clock. This is used to align the clock in the parent widget and also to align the text
  final AlignmentGeometry? alignment;

  /// The locale of the clock. If null, the locale of the device is used.
  final string? locale;

  /// The format of the clock. If null, the format is 'HH:mm:ss'.
  final string? format;

  final Duration shift;

  /// The callback that is called every time the clock contents change.
  /// if the clock contains only hours and minutes, this callback is called every minute.
  /// if the clock contains hours, minutes and seconds, this callback is called every second.
  /// if the clock contains hours, minutes, seconds and milliseconds, this callback is called every millisecond.
  /// if the clock contains hours, minutes, seconds, milliseconds and microseconds, this callback is called every microsecond.
  /// The callback receives the current time as a string formatted by [format].
  final void Function(string s)? onChange;

  /// If true, the clock will update every millisecond. If false, the clock will update every second.

  const DigitalClock({super.key, this.textStyle, this.format = 'HH:mm:ss', this.locale, this.alignment, this.onChange, this.shift = Duration.zero});
  @override
  createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _timeString = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.alignment?.toCrossAxisAlignment ?? CrossAxisAlignment.start,
      children: <Widget>[
        ..._timeString.splitLines.map(
          (x) => Text(
            maxLines: 1,
            x,
            style: widget.textStyle,
            textAlign: widget.alignment?.toTextAlign,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(1.microseconds, (Timer t) {
      if (mounted) {
        setState(() {
          final s = now.add(widget.shift).format(widget.format, widget.locale);
          if (s != _timeString) {
            _timeString = s;
            if (widget.onChange != null) widget.onChange!(_timeString);
          }
        });
      }
    });
  }
}
