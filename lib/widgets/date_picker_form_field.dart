import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateTimePickerFormField extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? fromDate;
  final DateTime? toDate;
  final bool allowManualInput;

  final string requiredMessage;
  final string invalidDateMessage;
  final string outOfRangeMessage;
  final string maskFormat = "dd/MM/yyyy";
  final void Function(string)? onChange;
  final InputDecoration? decoration;
  final TextEditingController? dateController;

  const DateTimePickerFormField({
    super.key,
    required this.invalidDateMessage,
    this.dateController,
    this.initialDate,
    this.fromDate,
    this.toDate,
    this.allowManualInput = true,
    this.requiredMessage = "",
    this.outOfRangeMessage = "",
    onChanged,
    this.onChange,
    this.decoration,
  });

  @override
  createState() => _DateTimePickerFormFieldState();
}

class _DateTimePickerFormFieldState extends State<DateTimePickerFormField> {
  TextEditingController _controller = TextEditingController();
  DateTime _initialData = DateTime.now();
  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now();
  @override
  void initState() {
    super.initState();
    initialize();
    _controller.addListener(() {
      try {
        format.parse(_controller.text);
      } catch (e) {
        consoleLog("$e");
        var dt = DateTime.tryParse(_controller.text);
        if (dt != null) {
          _controller.text = format.format(dt);
        }
      }
    });
  }

  MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter();
  DateFormat format = DateFormat();
  void initialize() {
    _start = widget.fromDate ?? DateTimeExtensions.min;
    _end = widget.toDate ?? DateTimeExtensions.max;
    _initialData = widget.initialDate ?? date.now();
    _controller = widget.dateController ?? _controller;
    format = DateFormat(widget.maskFormat);
    dateMaskFormatter = MaskTextInputFormatter(
      mask: widget.maskFormat.replaceMany(StringHelpers.alphaNumericChars, "#"), // Date format mask
      filter: {'#': RegExp(r'[0-9]')},
    );

    if (_controller.text.isBlank) {
      if (widget.initialDate != null) {
        _controller.text = format.format(_start);
      }
    } else {
      try {
        _initialData = format.parse(_controller.text);
      } catch (e) {
        consoleLog("$e");
        _initialData = DateTime.tryParse(_controller.text) ?? _initialData;
      }
    }
  }

  Future<void> _selectDate() async {
    initialize();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _initialData,
      firstDate: _start,
      lastDate: _end,
    );

    setState(() {
      if (picked != null) {
        _controller.text = format.format(picked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.allowManualInput ? null : _selectDate,
      child: TextFormField(
        controller: _controller,
        onEditingComplete: () {},
        onChanged: widget.onChange,
        decoration: (widget.decoration ?? const InputDecoration()).copyWith(
            suffixIcon: widget.allowManualInput
                ? IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _selectDate,
                  )
                : null),
        readOnly: !widget.allowManualInput,
        inputFormatters: [if (widget.allowManualInput) dateMaskFormatter],
        validator: _validateDate,
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }

  String? _validateDate(String? value) {
    if (value.isBlank && widget.requiredMessage.isNotBlank) return widget.requiredMessage;
    try {
      var dt = format.parse(value ?? "");
      if (dt.isBetweenOrEqual(_start, _end)) {
        return null;
      } else {
        return widget.outOfRangeMessage.ifBlank("Date is out of range");
      }
    } catch (e) {
      // _controller.clear();
      return widget.invalidDateMessage.ifBlank("$e");
    }
  }
}
