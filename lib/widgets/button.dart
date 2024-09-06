import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { primary, secondary, primaryColor, disabled }

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final double iconSize;
  final Color borderColor;
  final Color color;
  final ButtonType type;
  final String? rightIcon;
  final String? leftIcon;
  final bool showBorder;
  final Color backgroundColor;

  const Button({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.type = ButtonType.primary,
    this.leftIcon,
    this.rightIcon,
    this.height = 44,
    this.width = double.infinity,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 21,
    this.borderColor = CeylonScapeColor.primary50,
    this.color = CeylonScapeColor.black0,
    this.backgroundColor = CeylonScapeColor.primary50,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(0),
          ),
          child: Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                side: showBorder
                    ? BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: borderColor,
                      )
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              shadows: [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.5),
                  // color: Color(0x661EA0D9),
                  offset: const Offset(0, 4.5),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leftIcon != null)
                  Row(
                    children: [
                      SvgPicture.asset(
                        leftIcon!,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12,),
                    ],
                  ),
                Text(
                  buttonText,
                  style: CeylonScapeFont.highlightEmphasis.copyWith(
                    color: CeylonScapeColor.black0
                  ),
                ),
                if (rightIcon != null)
                  Row(
                    children: [
                      const SizedBox(width: 12,),
                      SvgPicture.asset(
                        rightIcon!,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ));
  }
}
