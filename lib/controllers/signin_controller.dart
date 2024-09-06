import 'package:CeylonScape/dto/login/login_request.dart';
import 'package:CeylonScape/dto/login/login_response.dart';
import 'package:CeylonScape/dto/login/signup_request.dart';
import 'package:CeylonScape/dto/login/signup_response.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class SignInController extends GetxController {
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoading = false.obs;
  final RxBool hasAttemptedSignIn = false.obs;

  // Missing input status
  final RxBool isEmailMissing = false.obs;
  final RxBool isPasswordMissing = false.obs;

  bool validateSignInForm(){
    isEmailMissing.value = emailController.text.isEmpty;
    isPasswordMissing.value = passwordController.text.isEmpty;
    hasAttemptedSignIn.value = true;
    
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  Future<bool> login() async {
    // check if all fields are filled
    if (!validateSignInForm()) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: CeylonScapeColor.black0,
      );
      return false;
    }
    isLoginLoading.value = true;
    hasAttemptedSignIn.value = false;

    LoginRequest loginRequest = LoginRequest(
        email: emailController.text, password: passwordController.text);
    try {
      final response = await _apiService.sendPostRequest(
        false, // Authentication is not required for login
        'api/Auth/Login',
        data: loginRequest.toJson(),
      );
      isLoginLoading.value = false;

      if (response == null) {
        return false;
      }

      if (response.statusCode != 200) {
        return false;
      }

      if (response.statusCode == 403) {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          colorText: CeylonScapeColor.black,
          backgroundColor: CeylonScapeColor.black0,
        );
      }
      // Assuming the response contains authentication-related data
      LoginResponse loginResponse = LoginResponse.fromJson(response.body);
      await _authService.setUserInfo(loginResponse);
      await _authService.setAuthentication(true);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
