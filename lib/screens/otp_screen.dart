import 'package:CeylonScape/screens/signin_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  color: CeylonScapeColor.black.withOpacity(0.3)
              ),
              child: SvgPicture.asset("assets/images/otp.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Verify OTP',
                    style: TextStyle(
                      color: CeylonScapeColor.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(
                    height: 15,
                  ),
                  Pinput(
                    length: 6,
                    onCompleted: (pin) => print(pin),
                  ),
                    const SizedBox(
                    height: 15,
                  ),
                  Button(
                      buttonText: "Verify",
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
