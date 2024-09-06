import 'package:CeylonScape/screens/otp_screen.dart';
import 'package:CeylonScape/screens/signin_screen.dart';
import 'package:CeylonScape/screens/signup_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 390,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                  color: CeylonScapeColor.primary30.withOpacity(0.3)
              ),
              child: SvgPicture.asset("assets/images/reset-password.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Provide a new password',
                    style: TextStyle(
                      color: CeylonScapeColor.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    labelText: 'Password',
                    placeholderText: 'Password',
                    isObscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    labelText: 'Confirm Password',
                    placeholderText: 'Confirm Password',
                    isObscureText: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      buttonText: "Reset",
                      onPressed: () => Get.to(() => SignInScreen())),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
