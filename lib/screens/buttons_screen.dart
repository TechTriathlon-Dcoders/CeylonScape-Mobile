import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/panel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Buttons")),
      // backgroundColor: CeylonScapeColor.backgroundColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Regular",
                onPressed: () => Get.back()),
            const SizedBox(height: 16),
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Right Icon",
                rightIcon: 'assets/icons/shine.svg',
                onPressed: () => Get.back()),
            const SizedBox(height: 16),
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Left Icon",
                leftIcon: 'assets/icons/shine.svg',
                onPressed: () => Get.back()),
          ],
        )),
      ),
    );
  }
}
