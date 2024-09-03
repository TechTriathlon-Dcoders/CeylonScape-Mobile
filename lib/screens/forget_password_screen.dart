import 'package:CeylonScape/screens/otp_screen.dart';
import 'package:CeylonScape/screens/signup_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 390,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                  // color: CeylonScapeColor.lightGrey.withOpacity(0.3)
              ),
              child: SvgPicture.asset("assets/images/reset-password.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reset Password',
                    style: TextStyle(
                      color: CeylonScapeColor.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(
                    height: 15,
                  ),
                  // InputField(
                  //   labelText: 'Mobile Number',
                  //   controller: mobileNumberController,
                  //   type: InputType.noTitle,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(
                      buttonText: "Reset",
                      onPressed: () => Get.to(() => OtpScreen())),
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
