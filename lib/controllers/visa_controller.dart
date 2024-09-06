import 'package:CeylonScape/dto/visa/visa_request.dart';
import 'package:CeylonScape/services/api_service.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisaController extends GetxController {
  final ApiService _apiService = ApiService();
  final TextEditingController pictureController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController birthCountryController = TextEditingController();
  final TextEditingController civilStatusController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController peculiarityController = TextEditingController();
  final TextEditingController domicileCountryAddressController = TextEditingController();
  final TextEditingController sriLankanAddressController = TextEditingController();
  final TextEditingController telephoneNumberController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameOfWorkPlaceController = TextEditingController();
  final TextEditingController addressOfWorkPlaceController = TextEditingController();
  final TextEditingController workPlaceEmailController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController placeOfPassportIssueController = TextEditingController();
  final TextEditingController dateOfPassportIssueController = TextEditingController();
  final TextEditingController dateOfPassportExpiryController = TextEditingController();
  final TextEditingController previousPassportNumberController = TextEditingController();
  final TextEditingController placeOfPreviousPassportIssueController = TextEditingController();
  final TextEditingController dateOfPreviousPassportIssueController = TextEditingController();
  final TextEditingController dateOfPreviousPassportExpiryController = TextEditingController();
  final TextEditingController spouseFullNameController = TextEditingController();
  final TextEditingController spouseNationalityController = TextEditingController();
  final TextEditingController spousePostalAddressController = TextEditingController();
  final TextEditingController spousePassportNumberController = TextEditingController();
  final TextEditingController spouseDateOfPassportExpiryController = TextEditingController();
  final TextEditingController dateOfNaturalizedController = TextEditingController();
  final TextEditingController placeOfNaturalizedController = TextEditingController();
  final TextEditingController formerNationalityController = TextEditingController();
  final TextEditingController routeAndModeOfTravelController = TextEditingController();
  final TextEditingController periodForVisitVisaController = TextEditingController();
  final TextEditingController lastPlaceOfResidenceController = TextEditingController();
  final TextEditingController dateOfLeavingController = TextEditingController();
  final TextEditingController lastObtainedVisaTypeController = TextEditingController();
  final TextEditingController lastObtainedVisaDateOfIssueController = TextEditingController();
  final TextEditingController lastObtainedVisaPeriodOfValidityController = TextEditingController();
  final TextEditingController lastObtainedVisaResidenceVisaNumberController = TextEditingController();
  final TextEditingController refusedVisaReasonController = TextEditingController();
  final TextEditingController emergencyContactNameController = TextEditingController();
  final TextEditingController emergencyContactAddressController = TextEditingController();
  final TextEditingController emergencyContactContactNumberController = TextEditingController();
  final TextEditingController emergencyContactRelationshipController = TextEditingController();
  final TextEditingController emergencyContactBelongingMoneyAmountController = TextEditingController();
  final TextEditingController emergencyContactNameOfCreditCardController = TextEditingController();
  final TextEditingController emergencyContactSpendableAmountController = TextEditingController();
  final TextEditingController urgeSupportReasonController = TextEditingController();
  final RxBool hasAttemptedApplyVisa = false.obs;
  final RxBool hasAttempNextInFirstPage = false.obs;

  RxString fullNameHintMessage = ''.obs;
  RxString nationalityHintMessage = ''.obs;
  RxString genderHintMessage = ''.obs;
  RxString dateOfBirthHintMessage = ''.obs;
  RxString birthPlaceHintMessage = ''.obs;
  RxString birthCountryHintMessage = ''.obs;
  RxString civilStatusHintMessage = ''.obs;

  bool validateSignInForm(){
    return true;
  }

  bool validateFirstPage() {
    fullNameHintMessage.value = fullNameController.text.isEmpty ? 'Full name is required' : '';
    nationalityHintMessage.value = nationalityController.text.isEmpty ? 'Nationality is required' : '';
    genderHintMessage.value = genderController.text.isEmpty ? 'Gender is required' : '';
    dateOfBirthHintMessage.value = dateOfBirthController.text.isEmpty ? 'Date of birth is required' : '';
    birthPlaceHintMessage.value = birthPlaceController.text.isEmpty ? 'Place of birth is required' : '';
    birthCountryHintMessage.value = birthCountryController.text.isEmpty ? 'Country of birth is required' : '';
    civilStatusHintMessage.value = civilStatusController.text.isEmpty ? 'Civil status is required' : '';

    hasAttempNextInFirstPage.value = true;

    return fullNameHintMessage.value.isEmpty
    && nationalityHintMessage.value.isEmpty
    && genderHintMessage.value.isEmpty
    && dateOfBirthHintMessage.value.isEmpty
    && birthPlaceHintMessage.value.isEmpty
    && birthCountryHintMessage.value.isEmpty
    && civilStatusHintMessage.value.isEmpty;
  }

  Future<bool> apply() async {
    // check if all fields are filled
    if (!validateSignInForm()) {
      Get.snackbar(
        'Error',
        'Please recheck all the fields',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: CeylonScapeColor.black0,
      );
      return false;
    }
    hasAttemptedApplyVisa.value = false;

    // VisaRequest loginRequest = VisaRequest(
    //     email: emailController.text, password: passwordController.text);
    try {
      final response = await _apiService.sendPostRequest(
        false, // Authentication is not required for login
        'visa/apply',
        // data: loginRequest.toJson(),
      );
      // print(response!.statusCode);
      // print(response.body);

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
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    pictureController.dispose();
    fullNameController.dispose();
    nationalityController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    birthPlaceController.dispose();
    birthCountryController.dispose();
    civilStatusController.dispose();
    heightController.dispose();
    peculiarityController.dispose();
    domicileCountryAddressController.dispose();
    sriLankanAddressController.dispose();
    telephoneNumberController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    nameOfWorkPlaceController.dispose();
    addressOfWorkPlaceController.dispose();
    workPlaceEmailController.dispose();
    passportNumberController.dispose();
    placeOfPassportIssueController.dispose();
    dateOfPassportIssueController.dispose();
    dateOfPassportExpiryController.dispose();
    previousPassportNumberController.dispose();
    placeOfPreviousPassportIssueController.dispose();
    dateOfPreviousPassportIssueController.dispose();
    dateOfPreviousPassportExpiryController.dispose();
    spouseFullNameController.dispose();
    spouseNationalityController.dispose();
    spousePostalAddressController.dispose();
    spousePassportNumberController.dispose();
    spouseDateOfPassportExpiryController.dispose();
    dateOfNaturalizedController.dispose();
    placeOfNaturalizedController.dispose();
    formerNationalityController.dispose();
    routeAndModeOfTravelController.dispose();
    periodForVisitVisaController.dispose();
    lastPlaceOfResidenceController.dispose();
    dateOfLeavingController.dispose();
    lastObtainedVisaTypeController.dispose();
    lastObtainedVisaDateOfIssueController.dispose();
    lastObtainedVisaPeriodOfValidityController.dispose();
    lastObtainedVisaResidenceVisaNumberController.dispose();
    refusedVisaReasonController.dispose();
    emergencyContactNameController.dispose();
    emergencyContactAddressController.dispose();
    emergencyContactContactNumberController.dispose();
    emergencyContactRelationshipController.dispose();
    emergencyContactBelongingMoneyAmountController.dispose();
    emergencyContactNameOfCreditCardController.dispose();
    emergencyContactSpendableAmountController.dispose();
    urgeSupportReasonController.dispose();
    super.onClose();
  }
}