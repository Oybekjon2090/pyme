// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../style/style.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  const DatePicker({super.key, required this.controller});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.displaySmall,
      readOnly: true,
      validator: (s) {
        if (s?.isEmpty ?? true) {
          return "enter_date";
        }
        return null;
      },
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: (() {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime.now())
                  .then((value) {
                widget.controller.text =
                    DateFormat('dd/MM/y').format(value ?? DateTime.now());
                setState(() {});
              });
            }),
            icon: const Icon(
              Icons.calendar_month,
              color: Style.greyColor90,
            )),
        hintText: "date",
        hintStyle:
            Style.textStyleRegular2(textColor: Style.greyColor90, size: 15),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffAFB0B6),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffAFB0B6),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Style.primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
