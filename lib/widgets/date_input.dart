import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../theme/colors.dart';

enum InputType { enabled, disabled}

class DateInput extends StatefulWidget {
  final InputType type;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final String? placeholderText;
  final String? helpText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool isNumber;
  final bool isCurrency;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.type = InputType.enabled,
    this.color = CeylonScapeColor.black40,
    this.height = 44,
    this.fillColor = CeylonScapeColor.black5,
    this.isNumber = false,
    this.isCurrency = false,
    this.helpText,
    this.onChanged,
    this.placeholderText,
    this.firstDate,
    this.lastDate
  });

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {

  late bool obscureText;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: CeylonScapeFont.contentRegular,
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
            controller: widget.type == InputType.disabled ? null : widget.controller,
            keyboardType: TextInputType.text,
            enabled: widget.type == InputType.disabled ? false : true,
            style: CeylonScapeFont.highlightRegular,
            decoration: InputDecoration(
              hintText: widget.placeholderText ?? widget.labelText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              prefixIcon: widget.isCurrency
                  ? Text(
                '\nUSD ',
                style: CeylonScapeFont.highlightRegular.copyWith(
                    color: CeylonScapeColor.black30,
                    height: 1
                ),
                textAlign: TextAlign.center,
              ) : null,
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/calendar.svg', // Path to your SVG file
                  width: 20, // Size of the icon
                  height: 20, // Size of the icon
                ),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: widget.firstDate ?? DateTime(1920),
                    lastDate: widget.lastDate ?? DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      String formattedDate = DateFormat('yyyy:MM:dd').format(picked);
                      widget.controller.text = formattedDate;
                    });
                  }
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: CeylonScapeColor.black30)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: CeylonScapeColor.primary50)),
              hintStyle: const TextStyle(color: CeylonScapeColor.black30),
            ),
          ),
        ),
        if(widget.helpText != null)
          Column(
            children: [
              const SizedBox(height: 3,),
              Text(
                widget.helpText!,
                style: CeylonScapeFont.captionRegular.copyWith(
                    color: CeylonScapeColor.error50
                ),
              )
            ],
          ),
      ],
    );
  }
}