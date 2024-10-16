import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateTimePickerFormField extends StatefulWidget {
  final DateTime? value;
  final DateTime? fromDate;
  final DateTime? toDate;
  final bool allowManualInput;

  final string requiredMessage;
  final string invalidDateMessage;
  final string outOfRangeMessage;
  final string maskFormat = "dd/MM/yyyy";
  final void Function(DateTime?) onChanged;
  final InputDecoration? decoration;
  final TextEditingController? dateController;

  const DateTimePickerFormField({
    super.key,
    required this.invalidDateMessage,
    this.dateController,
    this.value,
    this.fromDate,
    this.toDate,
    this.allowManualInput = true,
    this.requiredMessage = "",
    this.outOfRangeMessage = "",
    required this.onChanged,
    this.decoration,
  });

  @override
  createState() => _DateTimePickerFormFieldState();
}

class _DateTimePickerFormFieldState extends State<DateTimePickerFormField> {
  TextEditingController _controller = TextEditingController();

  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now();
  MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter();
  DateTime? value;
  DateFormat format = DateFormat();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.allowManualInput ? null : _selectDate,
      child: TextFormField(
        controller: _controller,
        onEditingComplete: () {},
        onChanged: (s) {
          widget.onChanged(format.tryParse(s));
        },
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initialize() {
    _start = widget.fromDate ?? minDate;
    _end = widget.toDate ?? maxDate;
    value = widget.value ?? date.now();
    _controller = widget.dateController ?? _controller;

    format = DateFormat(widget.maskFormat);
    dateMaskFormatter = MaskTextInputFormatter(
      mask: widget.maskFormat.replaceMany(Get.numberChars, "#"), // Date format mask
      filter: {
        '#': RegExp(r'[0-9]'),
        'A': RegExp(r'[A-Za-z]'),
      },
    );

    if (_controller.text.isBlank) {
      if (widget.value != null) {
        _controller.text = format.format(value ?? _start);
      }
    } else {
      try {
        value = format.parse(_controller.text);
      } catch (e) {
        consoleLog("$e");
        value = DateTime.tryParse(_controller.text) ?? value;
      }
    }
  }

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

  Future<void> _selectDate() async {
    initialize();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: _start,
      lastDate: _end,
    );

    setState(() {
      if (picked != null) {
        _controller.text = format.format(picked);
      }
    });
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
