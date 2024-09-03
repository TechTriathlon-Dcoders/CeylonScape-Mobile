import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum InputType { enabled, disabled}

class TextInput extends StatefulWidget {
  final InputType type;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final String? placeholderText;
  final String? helpText;
  final bool isObscureText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool isNumber;
  final bool isCurrency;

  const TextInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.type = InputType.enabled,
    this.color = CeylonScapeColor.black40,
    this.height = 44,
    this.fillColor = CeylonScapeColor.black5,
    this.isObscureText = false,
    this.isNumber = false,
    this.isCurrency = false,
    this.helpText,
    this.onChanged,
    this.placeholderText,
  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isObscureText ? true : false;
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
            obscureText: obscureText,
            keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
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
              suffixIcon: widget.isObscureText
                  ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: CeylonScapeColor.black30,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ) : null,
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