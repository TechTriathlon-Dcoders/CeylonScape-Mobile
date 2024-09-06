import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageTwo extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageTwo({super.key, required this.pageController});

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
              labelText: 'Height (in cm)*',
              controller: _visaController.heightController,
              placeholderText: 'Height',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Peculiarity',
              controller: _visaController.peculiarityController,
              placeholderText: 'Peculiarity',
            ),
            const SizedBox(height: 20,),

            Text(
              'Address',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return TextInput(
                  labelText: 'In the country of domicile*',
                  controller: _visaController.domicileCountryAddressController,
                  placeholderText: 'Address',
                  helpText: _visaController.domicileCountryAddressHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSecondPage.value
                      ? _visaController.domicileCountryAddressHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'During stay in Sri Lanka*',
                  controller: _visaController.sriLankanAddressController,
                  placeholderText: 'Address',
                  helpText: _visaController.sriLankanAddressHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSecondPage.value
                      ? _visaController.sriLankanAddressHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),

            Text(
              'Contact number',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return TextInput(
                  labelText: 'Telephone*',
                  controller: _visaController.telephoneNumberController,
                  placeholderText: '+94112175268',
                  helpText: _visaController.telephoneNumberHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSecondPage.value
                      ? _visaController.telephoneNumberHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Mobile*',
                  controller: _visaController.mobileNumberController,
                  placeholderText: '+94714872852',
                  helpText: _visaController.mobileNumberHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSecondPage.value
                      ? _visaController.mobileNumberHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Email*',
                  controller: _visaController.emailController,
                  placeholderText: 'Email',
                  helpText: _visaController.emailHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSecondPage.value
                      ? _visaController.emailHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Name and address of workplace*',
              controller: _visaController.nameOfWorkPlaceController,
              placeholderText: 'Name',
            ),
            const SizedBox(height: 10,),
            TextInput(
              controller: _visaController.addressOfWorkPlaceController,
              placeholderText: 'Address',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Workplace email*',
              controller: _visaController.workPlaceEmailController,
              placeholderText: 'Email',
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
                          if(_visaController.validateSecondPage()) {
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
