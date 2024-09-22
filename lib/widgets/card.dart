import 'package:CeylonScape/theme/colors.dart';
import 'package:flutter/material.dart';

enum CardType { light, datapackage, voicepackage, addon, extragb1, extragb2, extragb3, featuredpackage }

class CustomCard extends StatelessWidget {
  final Widget child; // New property to pass a child widget
  final CardType type;
  final bool showShadow;
  final BoxBorder? border;
  final double borderRadius;
  final Color backgroundColor;

  const CustomCard({
    super.key,
    required this.child,
    required this.type,
    this.border,
    this.borderRadius = 20,
    this.showShadow = true,
    this.backgroundColor = CeylonScapeColor.black0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      decoration: BoxDecoration(
        boxShadow: [
          showShadow
              ? BoxShadow(
                  color: CeylonScapeColor.black40.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  spreadRadius: 0,
                )
              : const BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
        ],
        color: backgroundColor,
        // gradient: LinearGradient(
        //   colors: type == CardType.light || type == CardType.addon || type == CardType.datapackage || type == CardType.voicepackage || type == CardType.extragb1
        //       ? CeylonScapeColor.lightGradient
        //         : CeylonScapeColor.getRandomGradient(type),
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        child: child,
        // decoration: BoxDecoration(
        //   color: CeylonScapeColor.white,
        // ),
      ),
    );
  }
}


