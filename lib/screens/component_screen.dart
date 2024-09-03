import 'package:CeylonScape/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'buttons_screen.dart';
import 'input_field_screen.dart';
import 'signup_screen.dart';
import '../widgets/button.dart';

class ComponentScreen extends StatelessWidget {
  const ComponentScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Components'),),
      backgroundColor: CeylonScapeColor.black0,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                buttonText: "Buttons",
                onPressed: () => Get.to(const ButtonsScreen()),
              ),
              const SizedBox(height: 24),
              Button(
                buttonText: "Inputs",
                onPressed: () => Get.to(InputScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}