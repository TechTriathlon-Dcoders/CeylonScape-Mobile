import 'package:CeylonScape/theme/fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../theme/colors.dart';

enum InputType { enabled, disabled}

class DropdownInput extends StatefulWidget {
  final InputType type;
  final Color color;
  final double height;
  final Color fillColor;
  final String? labelText;
  final String? placeholderText;
  final String? helpText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final List<String> options;

  const DropdownInput({
    super.key,

    required this.controller,
    required this.options,
    this.type = InputType.enabled,
    this.color = CeylonScapeColor.black40,
    this.height = 44,
    this.fillColor = CeylonScapeColor.black5,
    this.labelText,
    this.helpText,
    this.onChanged,
    this.placeholderText,
  });

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DropdownInput> {
  String? selectedValue;
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.options.first;
  }

  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? '',
            style: CeylonScapeFont.contentRegular,
          ),
        if (widget.labelText != null)
          const SizedBox(
            height: 6,
          ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: CeylonScapeColor.primary30,
              width: 1.5,
            )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              style: CeylonScapeFont.highlightRegular.copyWith(
                color: CeylonScapeColor.black90
              ),
              dropdownColor: CeylonScapeColor.black0,
              focusColor: CeylonScapeColor.black0,
              enableFeedback: false,
              isExpanded: true,
              elevation: 1,
              borderRadius: BorderRadius.circular(8),
              items: widget.options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: CeylonScapeFont.highlightRegular.copyWith(
                        color: CeylonScapeColor.black90
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                  widget.controller.text = newValue!;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue!);
                }
              },
              hint: widget.placeholderText != null
              ? Text(widget.placeholderText!)
                  : null,
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