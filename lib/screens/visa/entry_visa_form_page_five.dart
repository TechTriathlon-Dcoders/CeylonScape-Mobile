import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageFive extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageFive({super.key, required this.pageController});

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

            TextInput(
              labelText: 'Route and mode of travel',
              controller: _visaController.routeAndModeOfTravelController,
              placeholderText: 'Route & Mode',
              isTextArea: true,
              height: 240,
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Period for visit visa*',
                  controller: _visaController.periodForVisitVisaController,
                  placeholderText: 'Period',
                  isNumber: true,
                  helpText: _visaController.periodForVisitVisaHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.periodForVisitVisaHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),

            Text(
              'Previously in Sri Lanka?',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return TextInput(
                  labelText: 'Last place of residence*',
                  controller: _visaController.lastPlaceOfResidenceController,
                  placeholderText: 'Place',
                  helpText: _visaController.lastPlaceOfResidenceHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.lastPlaceOfResidenceHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of leaving*',
                  controller: _visaController.dateOfLeavingController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfLeavingHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.dateOfLeavingHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DropdownInput(
                    labelText: 'Last obtained visa*',
                    controller: _visaController.lastObtainedVisaTypeController,
                    options: const [
                      'Entry Visa',
                      'Business Visa',
                      'Medical Visa',
                      'Transit Visa',
                      'Residence Visa',
                      'Diplomatic & Official Visa'
                    ],
                    helpText: _visaController.lastObtainedVisaTypeHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.lastObtainedVisaTypeHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return DateInput(
                  labelText: 'Date of issue*',
                  controller: _visaController.lastObtainedVisaDateOfIssueController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.lastObtainedVisaDateOfIssueHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.lastObtainedVisaDateOfIssueHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Period of validity*',
                  controller: _visaController.lastObtainedVisaPeriodOfValidityController,
                  placeholderText: 'Period',
                  isNumber: true,
                  helpText: _visaController.lastObtainedVisaPeriodOfValidityHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFifthPage.value
                      ? _visaController.lastObtainedVisaPeriodOfValidityHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'If resident visa - resident visa number',
              controller: _visaController.lastObtainedVisaResidenceVisaNumberController,
              placeholderText: 'Visa number',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Has refused a visa?',
              controller: _visaController.refusedVisaReasonController,
              placeholderText: 'Specify the reason',
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
                          if(_visaController.validateFifthPage()) {
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