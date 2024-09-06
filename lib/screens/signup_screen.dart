import 'package:CeylonScape/controllers/signin_controller.dart';
import 'package:CeylonScape/controllers/signup_controller.dart';
import 'package:CeylonScape/screens/signin_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController _signUpController = Get.find();

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
              child: SvgPicture.asset("assets/images/sign-up.svg"),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign-Up',
                    style: TextStyle(
                      color: CeylonScapeColor.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    labelText: 'First Name',
                    placeholderText: 'John',
                    helpText: _signUpController.firstNameHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.firstNameHintMessage.value : null,
                    controller: _signUpController.firstNameController,
                    // type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Last Name',
                    placeholderText: 'Dow',
                    helpText: _signUpController.lastNameHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.lastNameHintMessage.value : null,
                    controller: _signUpController.lastNameController,
                    // type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Mobile Number',
                    placeholderText: '+9471487852',
                    helpText: _signUpController.mobileNumberHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.mobileNumberHintMessage.value : null,
                    controller: _signUpController.mobileNumberController,
                    // type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Email',
                    placeholderText: 'johndoe@gmail.com',
                    helpText: _signUpController.emailHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.emailHintMessage.value : null,
                    controller: _signUpController.emailController,
                    // type: InputType.separateTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Password',
                    placeholderText: 'Password',
                    helpText: _signUpController.passwordHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.passwordHintMessage.value : null,
                    controller: _signUpController.passwordController,
                    // type: InputType.separateTitle,
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    labelText: 'Confirm Password',
                    placeholderText: 'Confirm Password',
                    helpText: _signUpController.confirmPasswordHintMessage.value.isNotEmpty
                        && _signUpController.hasAttemptedSignUp.value
                        ? _signUpController.confirmPasswordHintMessage.value : null,
                    controller: _signUpController.confirmPasswordController,
                    // type: InputType.separateTitle,
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      buttonText: "Sign-Up",
                      onPressed: () {
                        _signUpController.signUp().then((value) {
                          if (value) {
                            Get.offAll(() => SignInScreen());
                            Get.snackbar(
                              icon: const Icon(
                                Icons.check_circle_rounded,
                                size: 26,
                                color: CeylonScapeColor.success40,
                              ),
                              shouldIconPulse: true,
                              "Success",
                              "You have successfully Registered",
                              colorText: CeylonScapeColor.black,
                            );
                          }
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontSize: 12,
                            color: CeylonScapeColor.black
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Get.to(() => SignInScreen()),
                          child: const Text(
                            'Sign-In',
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
