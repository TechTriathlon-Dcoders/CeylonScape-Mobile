import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum InputType { enabled, disabled}

class TextInput extends StatefulWidget {
  final InputType type;
  final Color color;
  final double height;
  final Color fillColor;
  final String? labelText;
  final String? placeholderText;
  final String? helpText;
  final bool isObscureText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool isNumber;
  final bool isTextArea;
  final bool isCurrency;
  final String? initialValue;
  final bool isProhibitedEdit;
  final bool isEnableBorder;
  final bool isFocusBorder;

  const TextInput({
    super.key,
    required this.controller,
    this.labelText,
    this.type = InputType.enabled,
    this.color = CeylonScapeColor.black40,
    this.height = 44,
    this.fillColor = CeylonScapeColor.black5,
    this.isObscureText = false,
    this.isNumber = false,
    this.isCurrency = false,
    this.isTextArea = false,
    this.helpText,
    this.onChanged,
    this.placeholderText,
    this.initialValue,
    this.isProhibitedEdit = false,
    this.isEnableBorder = true,
    this.isFocusBorder = true,
  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isObscureText;
    if (widget.initialValue != null && widget.controller.text.isEmpty) {
      widget.controller.text = widget.initialValue!;
    }
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
          ),
          child: TextField(
            maxLines: widget.isTextArea ? 10 : 1,
            onChanged: widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
            controller: widget.type == InputType.disabled ? null : widget.controller,
            obscureText: obscureText,
            keyboardType: widget.isNumber ? TextInputType.number : widget.isTextArea ? TextInputType.multiline : TextInputType.text,
            readOnly: widget.isProhibitedEdit,
            enabled: widget.type == InputType.disabled ? false : true,
            style: CeylonScapeFont.highlightRegular,
            decoration: InputDecoration(
              hintText: widget.placeholderText ?? '',
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
              border: InputBorder.none,
              enabledBorder: widget.isEnableBorder ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: CeylonScapeColor.primary30, width: 1.5)) : null,
              focusedBorder: widget.isFocusBorder ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: CeylonScapeColor.primary50, width: 1.5)) : null,
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