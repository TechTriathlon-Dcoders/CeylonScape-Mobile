import 'package:CeylonScape/controllers/auth_controller.dart';
import 'package:CeylonScape/screens/main_page.dart';
import 'package:CeylonScape/screens/forget_password_screen.dart';
import 'package:CeylonScape/screens/signup_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthController authController = Get.find();

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
              child: SvgPicture.asset("assets/images/sign-in.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign-In',
                  style: TextStyle(
                    color: CeylonScapeColor.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    labelText: 'Mobile Number',
                    controller: authController.emailController,
                    // type: InputType.noTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Password',
                    controller: authController.passwordController,
                    // type: InputType.noTitle,
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(
                      buttonText: "Login",
                      onPressed: () => {
                        authController.login().then((value) {
                          if (value) {
                            Get.offAll(() => const MainPage());
                            Get.snackbar(
                              icon: const Icon(
                                Icons.check_circle,
                                size: 26,
                                color: CeylonScapeColor.primary,
                              ),
                              shouldIconPulse: true,
                              "Success",
                              "Welcome to CeylonScape",
                              colorText: CeylonScapeColor.black,
                            );
                          }
                        })
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            fontSize: 12,
                            color: CeylonScapeColor.black
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => SignUpScreen()),
                          child: const Text(
                            'Sign-Up',
                            style: TextStyle(
                                fontSize: 12,
                                color: CeylonScapeColor.primary
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Forgot Password? ',
                        style: TextStyle(
                            fontSize: 12,
                            color: CeylonScapeColor.black
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Get.to(() => ForgotPasswordScreen()),
                          child: const Text(
                            'Reset-Password',
                            style: TextStyle(
                              fontSize: 12,
                              color: CeylonScapeColor.primary
                            ),
                          )
                      ),
                    ],
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
