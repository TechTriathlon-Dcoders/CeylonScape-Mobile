import 'package:CeylonScape/dto/login/login_request.dart';
import 'package:CeylonScape/dto/login/login_response.dart';
import 'package:CeylonScape/dto/login/signup_request.dart';
import 'package:CeylonScape/dto/login/signup_response.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class SignUpController extends GetxController {
  final ApiService _apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoading = false.obs;
  final RxBool hasAttemptedSignUp = false.obs;

  // Validation Messages
  RxString emailHintMessage = ''.obs;
  RxString mobileNumberHintMessage = ''.obs;
  RxString passwordHintMessage = ''.obs;
  RxString confirmPasswordHintMessage = ''.obs;
  RxString firstNameHintMessage = ''.obs;
  RxString lastNameHintMessage = ''.obs;

  // Validate Email
  String? validateEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // Validate Mobile Number
  String? validateMobileNumber(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      return 'Mobile number is required';
    } else if (!mobileNumber.startsWith('+')) {
      return 'Mobile number should start with a + sign';
    }
    return null;
  }

  // Validate Password
  String? validatePassword(String password) {
    String passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    if (password.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(passwordPattern).hasMatch(password)) {
      return 'Password must contain at least:\n'
          '• One lowercase letter\n'
          '• One uppercase letter\n'
          '• One special character\n'
          '• One number\n'
          '• Minimum length of 8 characters';
    }
    return null;
  }

  // Validate Confirm Password
  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Function to validate all fields
  bool validateSignUpForm() {
    emailHintMessage.value = validateEmail(emailController.text) ?? '';
    mobileNumberHintMessage.value = validateMobileNumber(mobileNumberController.text) ?? '';
    passwordHintMessage.value = validatePassword(passwordController.text) ?? '';
    confirmPasswordHintMessage.value = validateConfirmPassword(
        passwordController.text, confirmPasswordController.text) ?? '';
    firstNameHintMessage.value = firstNameController.text.isEmpty ? 'First name is required' : '';
    lastNameHintMessage.value = lastNameController.text.isEmpty ? 'Last name is required' : '';

    hasAttemptedSignUp.value = true;

    // Return true if all errors are empty, false otherwise
    return emailHintMessage.value.isEmpty
        && mobileNumberHintMessage.value.isEmpty
        && passwordHintMessage.value.isEmpty
        && confirmPasswordHintMessage.value.isEmpty
        && firstNameHintMessage.value.isEmpty
        && lastNameHintMessage.value.isEmpty
    ;
  }

  Future<bool> signUp() async {
    // check if all fields are filled
    if (!validateSignUpForm()) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: CeylonScapeColor.black0,
      );
      return false;
    }
    isLoginLoading.value = true;
    hasAttemptedSignUp.value = false;

    SignUpRequest signUpRequest = SignUpRequest(
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      mobileNumber: mobileNumberController.text,
      password: passwordController.text
    );
    try {
      final response = await _apiService.sendPostRequest(
        false, // Authentication is not required for login
        'User',
        data: signUpRequest.toJson(),
      );
      isLoginLoading.value = false;

      if (response == null) {
        return false;
      }

      if (response.statusCode != 200 && response.statusCode != 201) {
        return false;
      }

      if (response.statusCode == 403) {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          colorText: CeylonScapeColor.black,
          backgroundColor: CeylonScapeColor.black0,
          icon: const Icon(Icons.error_rounded, color: CeylonScapeColor.error50,)
        );
      }
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
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    super.onClose();
  }
}
