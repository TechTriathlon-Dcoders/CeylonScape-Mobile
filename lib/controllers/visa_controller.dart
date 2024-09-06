import 'package:CeylonScape/dto/visa/visa_request.dart';
import 'package:CeylonScape/services/api_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  var selectedImagePath = ''.obs;
  var selectedImageBytes = <int>[].obs;

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from gallery or camera
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImagePath.value = image.path;
      selectedImageBytes.value = await image.readAsBytes();
    }
  }

  final RxBool hasAttemptedApplyVisa = false.obs;
  final RxBool hasAttemptNextInFirstPage = false.obs;
  final RxBool hasAttemptNextInSecondPage = false.obs;
  final RxBool hasAttemptNextInThirdPage = false.obs;
  final RxBool hasAttemptNextInFourthPage = false.obs;
  final RxBool hasAttemptNextInFifthPage = false.obs;
  final RxBool hasAttemptNextInSixthPage = false.obs;

  RxString fullNameHintMessage = ''.obs;
  RxString nationalityHintMessage = ''.obs;
  RxString genderHintMessage = ''.obs;
  RxString dateOfBirthHintMessage = ''.obs;
  RxString birthPlaceHintMessage = ''.obs;
  RxString birthCountryHintMessage = ''.obs;
  RxString civilStatusHintMessage = ''.obs;

  RxString heightHintMessage = ''.obs;
  RxString peculiarityHintMessage = ''.obs;
  RxString domicileCountryAddressHintMessage = ''.obs;
  RxString sriLankanAddressHintMessage = ''.obs;
  RxString telephoneNumberHintMessage = ''.obs;
  RxString mobileNumberHintMessage = ''.obs;
  RxString emailHintMessage = ''.obs;
  RxString nameOfWorkPlaceHintMessage = ''.obs;
  RxString addressOfWorkPlaceHintMessage = ''.obs;
  RxString workPlaceEmailHintMessage = ''.obs;

  RxString passportNumberHintMessage = ''.obs;
  RxString placeOfPassportIssueHintMessage = ''.obs;
  RxString dateOfPassportIssueHintMessage = ''.obs;
  RxString dateOfPassportExpiryHintMessage = ''.obs;
  RxString previousPassportNumberHintMessage = ''.obs;
  RxString placeOfPreviousPassportIssueHintMessage = ''.obs;
  RxString dateOfPreviousPassportIssueHintMessage = ''.obs;
  RxString dateOfPreviousPassportExpiryHintMessage = ''.obs;

  RxString spouseFullNameHintMessage = ''.obs;
  RxString spouseNationalityHintMessage = ''.obs;
  RxString spousePostalAddressHintMessage = ''.obs;
  RxString spousePassportNumberHintMessage = ''.obs;
  RxString spouseDateOfPassportExpiryHintMessage = ''.obs;
  RxString dateOfNaturalizedHintMessage = ''.obs;
  RxString placeOfNaturalizedHintMessage = ''.obs;
  RxString formerNationalityHintMessage = ''.obs;

  RxString periodForVisitVisaHintMessage = ''.obs;
  RxString lastPlaceOfResidenceHintMessage = ''.obs;
  RxString dateOfLeavingHintMessage = ''.obs;
  RxString lastObtainedVisaTypeHintMessage = ''.obs;
  RxString lastObtainedVisaDateOfIssueHintMessage = ''.obs;
  RxString lastObtainedVisaPeriodOfValidityHintMessage = ''.obs;

  RxString emergencyContactNameHintMessage = ''.obs;
  RxString emergencyContactAddressHintMessage = ''.obs;
  RxString emergencyContactContactNumberHintMessage = ''.obs;
  RxString emergencyContactRelationshipHintMessage = ''.obs;

  bool validateSignInForm(){
    return true;
  }

  bool isCivilStatusMarried() {
    return civilStatusController.text == 'Married';
  }

  bool validateFirstPage() {
    fullNameHintMessage.value = fullNameController.text.isEmpty ? 'Full name is required' : '';
    nationalityHintMessage.value = nationalityController.text.isEmpty ? 'Nationality is required' : '';
    genderHintMessage.value = genderController.text.isEmpty ? 'Gender is required' : '';
    dateOfBirthHintMessage.value = dateOfBirthController.text.isEmpty ? 'Date of birth is required' : '';
    birthPlaceHintMessage.value = birthPlaceController.text.isEmpty ? 'Place of birth is required' : '';
    birthCountryHintMessage.value = birthCountryController.text.isEmpty ? 'Country of birth is required' : '';
    civilStatusHintMessage.value = civilStatusController.text.isEmpty ? 'Civil status is required' : '';

    hasAttemptNextInFirstPage.value = true;

    return fullNameHintMessage.value.isEmpty
    && nationalityHintMessage.value.isEmpty
    && genderHintMessage.value.isEmpty
    && dateOfBirthHintMessage.value.isEmpty
    && birthPlaceHintMessage.value.isEmpty
    && birthCountryHintMessage.value.isEmpty
    && civilStatusHintMessage.value.isEmpty;
  }

  bool validateSecondPage() {
    domicileCountryAddressHintMessage.value = domicileCountryAddressController.text.isEmpty ? 'Address is required' : '';
    sriLankanAddressHintMessage.value = sriLankanAddressController.text.isEmpty ? 'Address is required' : '';
    telephoneNumberHintMessage.value = validateMobileNumber(telephoneNumberController.text) ?? '';
    mobileNumberHintMessage.value = validateMobileNumber(mobileNumberController.text) ?? '';
    emailHintMessage.value = validateEmail(emailController.text) ?? '';

    hasAttemptNextInSecondPage.value = true;

    return domicileCountryAddressHintMessage.value.isEmpty
        && sriLankanAddressHintMessage.value.isEmpty
        && telephoneNumberHintMessage.value.isEmpty
        && mobileNumberHintMessage.value.isEmpty
        && emailHintMessage.value.isEmpty;
  }

  bool validatePreviousPassportInfoFilled() {
    return validateByGroup([
      previousPassportNumberController.text,
      placeOfPreviousPassportIssueController.text,
      dateOfPreviousPassportIssueController.text,
      dateOfPreviousPassportExpiryController.text,
    ]);
  }

  bool validateNaturalizedInfoFilled() {
    return validateByGroup([
      dateOfNaturalizedController.text,
      placeOfNaturalizedController.text,
      formerNationalityController.text
    ]);
  }

  bool validatePreviouslyInSriLankaFilled() {
    return validateByGroup([
      lastPlaceOfResidenceController.text,
      dateOfLeavingController.text,
      lastObtainedVisaTypeController.text,
      lastObtainedVisaDateOfIssueController.text,
      lastObtainedVisaPeriodOfValidityController.text
    ]);
  }

  bool validateEmergencyContactInfoFilled() {
    return validateByGroup([
      emergencyContactNameController.text,
      emergencyContactAddressController.text,
      emergencyContactContactNumberController.text,
      emergencyContactRelationshipController.text
    ]);
  }

  bool validateByGroup(List<String> list) {
    bool allEmpty = list.every((field) => field.isEmpty);
    bool allFilled = list.every((field) => field.isNotEmpty);
    return allEmpty || allFilled;
  }

  bool validateThirdPage() {
    passportNumberHintMessage.value = passportNumberController.text.isEmpty ? 'Passport number is required' : '';
    placeOfPassportIssueHintMessage.value = placeOfPassportIssueController.text.isEmpty ? 'Place is required' : '';
    dateOfPassportIssueHintMessage.value = dateOfPassportIssueController.text.isEmpty ? 'Date is required' : '';
    dateOfPassportExpiryHintMessage.value = validateTwoDates(dateOfPassportIssueController.text, dateOfPassportExpiryController.text, 'Expiry date') ?? '';
    previousPassportNumberHintMessage.value = validatePreviousPassportInfoFilled() ? 'Fill all if you have a previous passport' : '';
    placeOfPreviousPassportIssueHintMessage.value = validatePreviousPassportInfoFilled() ? 'Fill all if you have a previous passport' : '';
    dateOfPreviousPassportIssueHintMessage.value = validatePreviousPassportInfoFilled() ? 'Fill all if you have a previous passport' : '';
    dateOfPreviousPassportExpiryHintMessage.value = validatePreviousPassportInfoFilled() ? 'Fill all if you have a previous passport'
        : validateTwoDates(dateOfPreviousPassportIssueController.text, dateOfPreviousPassportExpiryController.text, 'Expiry date') ?? '';

    hasAttemptNextInThirdPage.value = true;

    return passportNumberHintMessage.value.isEmpty
        && placeOfPassportIssueHintMessage.value.isEmpty
        && dateOfPassportIssueHintMessage.value.isEmpty
        && dateOfPassportExpiryHintMessage.value.isEmpty
        && previousPassportNumberHintMessage.value.isEmpty
        && placeOfPreviousPassportIssueHintMessage.value.isEmpty
        && dateOfPreviousPassportIssueHintMessage.value.isEmpty
        && dateOfPreviousPassportExpiryHintMessage.value.isEmpty;
  }

  bool validateFourthPage() {
    spouseFullNameHintMessage.value = spouseFullNameController.text.isEmpty && isCivilStatusMarried() ? "Full name is required" : '';
    spouseNationalityHintMessage.value = spouseNationalityController.text.isEmpty && isCivilStatusMarried() ? "Nationality is required" : '';
    spousePostalAddressHintMessage.value = spousePostalAddressController.text.isEmpty && isCivilStatusMarried() ? "Postal address is required" : '';
    spousePassportNumberHintMessage.value = spousePassportNumberController.text.isEmpty && isCivilStatusMarried() ? "Passport number is required" : '';
    spouseDateOfPassportExpiryHintMessage.value = spouseDateOfPassportExpiryController.text.isEmpty && isCivilStatusMarried() ? "Date of expiry is required" : '';
    dateOfNaturalizedHintMessage.value = validateNaturalizedInfoFilled() ? 'Fill all if you have been naturalized' : '';
    placeOfNaturalizedHintMessage.value = validateNaturalizedInfoFilled() ? 'Fill all if you have been naturalized' : '';
    formerNationalityHintMessage.value = validateNaturalizedInfoFilled() ? 'Fill all if you have been naturalized'
        : nationalityController.text == formerNationalityController.text
        ? 'Cannot be your current nationality' : '';

    hasAttemptNextInFourthPage.value = true;

    return spouseFullNameHintMessage.value.isEmpty
        && spouseNationalityHintMessage.value.isEmpty
        && spousePostalAddressHintMessage.value.isEmpty
        && spousePassportNumberHintMessage.value.isEmpty
        && spouseDateOfPassportExpiryHintMessage.value.isEmpty
        && dateOfNaturalizedHintMessage.value.isEmpty
        && formerNationalityHintMessage.value.isEmpty;
  }

  bool validateFifthPage() {
    // routeAndModeOfTravelHintMessage.value =
    periodForVisitVisaHintMessage.value = periodForVisitVisaController.text.isEmpty ? 'Period is required' : '';
    lastPlaceOfResidenceHintMessage.value = validatePreviouslyInSriLankaFilled() ? 'Fill all if you were in Sri Lanka before' : '';
    dateOfLeavingHintMessage.value = validatePreviouslyInSriLankaFilled() ? 'Fill all if you were in Sri Lanka before'
        : validateTwoDates(lastObtainedVisaDateOfIssueController.text, dateOfLeavingController.text, 'Leaving date') ?? '';
    lastObtainedVisaTypeHintMessage.value = validatePreviouslyInSriLankaFilled() ? 'Fill all if you were in Sri Lanka before' : '';
    lastObtainedVisaDateOfIssueHintMessage.value = validatePreviouslyInSriLankaFilled() ? 'Fill all if you were in Sri Lanka before' : '';
    lastObtainedVisaPeriodOfValidityHintMessage.value = validatePreviouslyInSriLankaFilled() ? 'Fill all if you were in Sri Lanka before' : '';
    // lastObtainedVisaResidenceVisaNumberHintMessage.value =
    // refusedVisaReasonHintMessage.value =

    hasAttemptNextInFifthPage.value = true;

    return periodForVisitVisaHintMessage.value.isEmpty
        && lastPlaceOfResidenceHintMessage.value.isEmpty
        && dateOfLeavingHintMessage.value.isEmpty
        && lastObtainedVisaTypeHintMessage.value.isEmpty
        && lastObtainedVisaDateOfIssueHintMessage.value.isEmpty
        && lastObtainedVisaPeriodOfValidityHintMessage.value.isEmpty;
  }

  bool validateSixthPage() {
    emergencyContactNameHintMessage.value = validateEmergencyContactInfoFilled() ? 'Fill all if you have an emergency contact' : '';
    emergencyContactAddressHintMessage.value = validateEmergencyContactInfoFilled() ? 'Fill all if you have an emergency contact' : '';
    emergencyContactContactNumberHintMessage.value = validateEmergencyContactInfoFilled() ? 'Fill all if you have an emergency contact'
        : validateMobileNumber(emergencyContactContactNumberController.text) ?? '';
    emergencyContactRelationshipHintMessage.value = validateEmergencyContactInfoFilled() ? 'Fill all if you have an emergency contact' : '';

    hasAttemptNextInSixthPage.value = true;

    return emergencyContactNameHintMessage.value.isEmpty
        && emergencyContactAddressHintMessage.value.isEmpty
        && emergencyContactContactNumberHintMessage.value.isEmpty
        && emergencyContactRelationshipHintMessage.value.isEmpty;
  }

  Future<bool> apply() async {
    // check if all fields are filled
    // if (!validateSignInForm()) {
    //   Get.snackbar(
    //     'Error',
    //     'Please recheck all the fields',
    //     backgroundColor: Colors.red.withOpacity(0.6),
    //     colorText: CeylonScapeColor.black0,
    //   );
    //   return false;
    // }
    hasAttemptedApplyVisa.value = false;

    VisaRequest applyVisaRequest = VisaRequest(
        picture: pictureController.text,
        fullName: fullNameController.text,
        nationality: nationalityController.text,
        gender: genderController.text,
        dateOfBirth: dateOfBirthController.text,
        birthPlace: birthPlaceController.text,
        birthCountry: birthCountryController.text,
        civilStatus: civilStatusController.text,
        height: heightController.text,
        peculiarity: peculiarityController.text,
        domicileCountryAddress: domicileCountryAddressController.text,
        sriLankanAddress: sriLankanAddressController.text,
        telephoneNumber: telephoneNumberController.text,
        mobileNumber: mobileNumberController.text,
        email: emailController.text,
        nameOfWorkPlace: nameOfWorkPlaceController.text,
        addressOfWorkPlace: addressOfWorkPlaceController.text,
        workPlaceEmail: workPlaceEmailController.text,
        passportNumber: passportNumberController.text,
        placeOfPassportIssue: placeOfPassportIssueController.text,
        dateOfPassportIssue: dateOfPassportIssueController.text,
        dateOfPassportExpiry: dateOfPassportExpiryController.text,
        previousPassportNumber: previousPassportNumberController.text,
        placeOfPreviousPassportIssue: placeOfPreviousPassportIssueController.text,
        dateOfPreviousPassportIssue: dateOfPreviousPassportIssueController.text,
        dateOfPreviousPassportExpiry: dateOfPreviousPassportExpiryController.text,
        spouseFullName: spouseFullNameController.text,
        spouseNationality: spouseNationalityController.text,
        spousePostalAddress: spousePostalAddressController.text,
        spousePassportNumber: spousePassportNumberController.text,
        spouseDateOfPassportExpiry: spouseDateOfPassportExpiryController.text,
        dateOfNaturalized: dateOfNaturalizedController.text,
        placeOfNaturalized: placeOfNaturalizedController.text,
        formerNationality: formerNationalityController.text,
        routeAndModeOfTravel: routeAndModeOfTravelController.text,
        periodForVisitVisa: periodForVisitVisaController.text,
        lastPlaceOfResidence: lastPlaceOfResidenceController.text,
        dateOfLeaving: dateOfLeavingController.text,
        lastObtainedVisaType: lastObtainedVisaTypeController.text,
        lastObtainedVisaDateOfIssue: lastObtainedVisaDateOfIssueController.text,
        lastObtainedVisaPeriodOfValidity: lastObtainedVisaPeriodOfValidityController.text,
        lastObtainedVisaResidenceVisaNumber: lastObtainedVisaResidenceVisaNumberController.text,
        refusedVisaReason: refusedVisaReasonController.text,
        emergencyContactName: emergencyContactNameController.text,
        emergencyContactAddress: emergencyContactAddressController.text,
        emergencyContactContactNumber: emergencyContactContactNumberController.text,
        emergencyContactRelationship: emergencyContactRelationshipController.text,
        emergencyContactBelongingMoneyAmount: emergencyContactBelongingMoneyAmountController.text,
        emergencyContactNameOfCreditCard: emergencyContactNameOfCreditCardController.text,
        emergencyContactSpendableAmount: emergencyContactSpendableAmountController.text,
        urgeSupportReason: urgeSupportReasonController.text,
    );
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