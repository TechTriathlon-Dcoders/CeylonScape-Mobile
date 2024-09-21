import 'package:CeylonScape/screens/recommendation/recommendation_screen.dart';
import 'package:CeylonScape/screens/signin_screen.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/card_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'buttons_screen.dart';
import 'input_field_screen.dart';
import 'signup_screen.dart';
import '../widgets/button.dart';

class ComponentScreen extends StatelessWidget {
  ComponentScreen({super.key});

  final AuthService _authService = Get.find();

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
              const SizedBox(height: 24),
              Button(
                buttonText: "Auth Flow",
                onPressed: () => Get.to(SignInScreen()),
              ),
              const SizedBox(height: 24),
              const CardDialog(),
              const SizedBox(height: 24),
              Button(
                buttonText: "Logout",
                onPressed: () {
                  _authService.forceLogout();
                  Get.offAll(() => SignInScreen());
                },
              ),
              const SizedBox(height: 24),
              Button(
                buttonText: "Recommendation Flow",
                onPressed: () => Get.to(RecommendationScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}