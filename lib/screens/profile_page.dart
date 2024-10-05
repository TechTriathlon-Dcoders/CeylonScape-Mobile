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

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthService _authService = Get.find();

  @override
  Widget build(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                buttonText: "Logout",
                onPressed: () {
                  _authService.forceLogout();
                  Get.offAll(() => SignInScreen());
                },
              ),
              // const SizedBox(height: 24),
              // Button(
              //   buttonText: "Try Recommendation",
              //   onPressed: () => Get.to(RecommendationScreen()),
              // ),
            ],
          ),
        ),
      );
  }
}