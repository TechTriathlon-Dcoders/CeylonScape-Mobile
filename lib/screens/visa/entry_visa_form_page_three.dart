import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageThree extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageThree({super.key, required this.pageController});

  final VisaController _visaController = Get.find();

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

            Text(
              'Passport',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return TextInput(
                  labelText: 'Number*',
                  controller: _visaController.passportNumberController,
                  placeholderText: 'Number',
                  helpText: _visaController.passportNumberHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.passportNumberHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Place of issue*',
                  controller: _visaController.placeOfPassportIssueController,
                  placeholderText: 'Place',
                  helpText: _visaController.placeOfPassportIssueHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.placeOfPassportIssueHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of issue*',
                  controller: _visaController.dateOfPassportIssueController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfPassportIssueHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.dateOfPassportIssueHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of expiry*',
                  controller: _visaController.dateOfPassportExpiryController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfPassportExpiryHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.dateOfPassportExpiryHintMessage.value : null,
                  lastDate: DateTime.now().add(const Duration(days: 300))
                );
              }
            ),
            const SizedBox(height: 20,),

            Text(
              'Previous Passport',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return TextInput(
                  labelText: 'Number*',
                  controller: _visaController.previousPassportNumberController,
                  placeholderText: 'Number',
                  helpText: _visaController.previousPassportNumberHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.previousPassportNumberHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Place of issue*',
                  controller: _visaController.placeOfPreviousPassportIssueController,
                  placeholderText: 'Place',
                  helpText: _visaController.placeOfPreviousPassportIssueHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.placeOfPreviousPassportIssueHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of issue*',
                  controller: _visaController.dateOfPreviousPassportIssueController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfPreviousPassportIssueHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.dateOfPreviousPassportIssueHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of expiry*',
                  controller: _visaController.dateOfPreviousPassportExpiryController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfPassportExpiryHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInThirdPage.value
                      ? _visaController.dateOfPassportExpiryHintMessage.value : null,
                  lastDate: DateTime.now().add(const Duration(days: 300)),
                );
              }
            ),

            const SizedBox(height: 32,),
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Button(
                        type: ButtonType.primaryColor,
                        buttonText: "Previous",
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 20),
                            curve: Curves.easeInOut,
                          );
                        }),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Button(
                        type: ButtonType.primaryColor,
                        buttonText: "Next",
                        onPressed: () {
                          if(_visaController.validateThirdPage()) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 20),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Get.snackbar(
                                'Error',
                                'Please check all inputs',
                                colorText: CeylonScapeColor.black,
                                backgroundColor: CeylonScapeColor.black0,
                                icon: const Icon(Icons.error_rounded, color: CeylonScapeColor.error50,)
                            );
                          }
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}