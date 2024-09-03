import 'package:CeylonScape/theme/colors.dart';
import 'package:flutter/material.dart';

enum CardType { light, datapackage, voicepackage, addon, extragb1, extragb2, extragb3, featuredpackage }

class CustomCard extends StatelessWidget {
  final Widget child; // New property to pass a child widget
  final CardType type;
  final bool showShadow;
  final bool showBorder;
  const CustomCard({
    super.key,
    required this.child,
    required this.type, // Initialize the child widget
    this.showShadow = true,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      decoration: BoxDecoration(
        boxShadow: [
          showShadow
              ? const BoxShadow(
                  color: CeylonScapeColor.black0,
                  blurRadius: 16,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                )
              : const BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
        ],
        // gradient: LinearGradient(
        //   colors: type == CardType.light || type == CardType.addon || type == CardType.datapackage || type == CardType.voicepackage || type == CardType.extragb1
        //       ? CeylonScapeColor.lightGradient
        //         : CeylonScapeColor.getRandomGradient(type),
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        border: showBorder
            ? Border.all(
                color: CeylonScapeColor.black5,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(20),
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


