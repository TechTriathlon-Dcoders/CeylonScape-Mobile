import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/util/static_data.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageOne extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageOne({super.key, required this.pageController});

  final VisaController _visaController = Get.find();
  final AuthService _authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32,),
            SizedBox(
              width: 330,
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'Application for\n',
                      style: CeylonScapeFont.headingLarger,
                      children: [
                        TextSpan(
                            text: 'Entry Visa',
                            style: CeylonScapeFont.headingLarger.copyWith(
                                fontWeight: FontWeight.w700,
                                color: CeylonScapeColor.primary50
                            )
                        ),
                      ]
                  )
              ),
            ),
            const SizedBox(height: 64,),

            Obx(() {
                return TextInput(
                  labelText: 'Full name*',
                  controller: _visaController.fullNameController,
                  // helpText: 'Enter a valid passport number',
                  placeholderText: 'Full name',
                  helpText: _visaController.fullNameHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.fullNameHintMessage.value : null,
                  initialValue: _authService.getFullName(),
                  isProhibitedEdit: true,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Nationality*',
                  controller: _visaController.nationalityController,
                  helpText: _visaController.nationalityHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.nationalityHintMessage.value : null,
                  placeholderText: 'Nationality',
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DropdownInput(
                    labelText: 'Gender*',
                    controller: _visaController.genderController,
                    options: const [
                      'Male',
                      'Female'
                    ],
                    helpText: _visaController.genderHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.genderHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of birth*',
                  controller: _visaController.dateOfBirthController,
                  // helpText: 'Enter a valid date',
                  placeholderText: 'YYYY:MM:DD',
                  lastDate: DateTime.now(),
                  helpText: _visaController.dateOfBirthHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.dateOfBirthHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Birth place*',
                  controller: _visaController.birthPlaceController,
                  // helpText: 'Enter a valid place',
                  placeholderText: 'Place',
                  helpText: _visaController.birthPlaceHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.birthPlaceHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DropdownInput(
                    labelText: 'Birth country*',
                    controller: _visaController.birthCountryController,
                    options: listOfCountries,
                    helpText: _visaController.birthCountryHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.birthCountryHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DropdownInput(
                    labelText: 'Civil status*',
                    controller: _visaController.civilStatusController,
                    options: const [
                      'Single',
                      'Married'
                    ],
                    helpText: _visaController.civilStatusHintMessage.value.isNotEmpty
                      && _visaController.hasAttempNextInFirstPage.value
                      ? _visaController.civilStatusHintMessage.value : null,
                );
              }
            ),

            const SizedBox(height: 32,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Button(
                      type: ButtonType.primaryColor,
                      buttonText: "Next",
                      onPressed: () {
                        // if(_visaController.validateFirstPage()) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 20),
                            curve: Curves.easeInOut,
                          );
                        // } else {
                        //   Get.snackbar(
                        //       'Error',
                        //       'Please check all inputs',
                        //       colorText: CeylonScapeColor.black,
                        //       backgroundColor: CeylonScapeColor.black0,
                        //       icon: const Icon(Icons.error_rounded, color: CeylonScapeColor.error50,)
                        //   );
                        // }
                      }),
                )
              ],
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
