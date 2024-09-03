import 'package:flutter/material.dart';

class DynamicColors extends ThemeExtension<DynamicColors> {
  final Color black;
  final Color black95;
  final Color black90;
  final Color black80;
  final Color black70;
  final Color black60;
  final Color black50;
  final Color black40;
  final Color black30;
  final Color black20;
  final Color black10;
  final Color black5;
  final Color black0;

  const DynamicColors({
    required this.black,
    required this.black95,
    required this.black90,
    required this.black80,
    required this.black70,
    required this.black60,
    required this.black50,
    required this.black40,
    required this.black30,
    required this.black20,
    required this.black10,
    required this.black5,
    required this.black0,
  });

  @override
  DynamicColors copyWith({
    Color? black,
    Color? black95,
    Color? black90,
    Color? black80,
    Color? black70,
    Color? black60,
    Color? black50,
    Color? black40,
    Color? black30,
    Color? black20,
    Color? black10,
    Color? black5,
    Color? black0,
  }) {
    return DynamicColors(
      black: black ?? this.black,
      black95: black95 ?? this.black95,
      black90: black90 ?? this.black90,
      black80: black90 ?? this.black80,
      black70: black90 ?? this.black70,
      black60: black90 ?? this.black60,
      black50: black90 ?? this.black50,
      black40: black90 ?? this.black40,
      black30: black90 ?? this.black30,
      black20: black90 ?? this.black20,
      black10: black90 ?? this.black10,
      black5: black90 ?? this.black5,
      black0: black90 ?? this.black0,
    );
  }

  @override
  DynamicColors lerp(ThemeExtension<DynamicColors>? other, double t) {
    if (other is! DynamicColors) return this;
    return DynamicColors(
      black: Color.lerp(black, other.black, t)!,
      black95: Color.lerp(black95, other.black95, t)!,
      black90: Color.lerp(black90, other.black90, t)!,
      black80: Color.lerp(black80, other.black80, t)!,
      black70: Color.lerp(black70, other.black70, t)!,
      black60: Color.lerp(black60, other.black60, t)!,
      black50: Color.lerp(black50, other.black50, t)!,
      black40: Color.lerp(black40, other.black40, t)!,
      black30: Color.lerp(black30, other.black30, t)!,
      black20: Color.lerp(black20, other.black20, t)!,
      black10: Color.lerp(black10, other.black10, t)!,
      black5: Color.lerp(black5, other.black5, t)!,
      black0: Color.lerp(black0, other.black0, t)!,
    );
  }
}
