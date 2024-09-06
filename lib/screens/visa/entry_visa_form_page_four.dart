import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageFour extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageFour({super.key, required this.pageController});

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

            if (_visaController.isCivilStatusMarried())
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spouse details',
                    style: CeylonScapeFont.featureAccent,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20,),

                  Obx(() {
                      return TextInput(
                        labelText: 'Full Name*',
                        controller: _visaController.spouseFullNameController,
                        placeholderText: 'Full name',
                        helpText: _visaController.spouseFullNameHintMessage.value.isNotEmpty
                            && _visaController.hasAttemptNextInFourthPage.value
                            ? _visaController.spouseFullNameHintMessage.value : null,
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                  Obx(() {
                      return TextInput(
                        labelText: 'Nationality*',
                        controller: _visaController.spouseNationalityController,
                        placeholderText: 'Nationality',
                        helpText: _visaController.spouseNationalityHintMessage.value.isNotEmpty
                            && _visaController.hasAttemptNextInFourthPage.value
                            ? _visaController.spouseNationalityHintMessage.value : null,
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                  Obx(() {
                      return TextInput(
                        labelText: 'Postal address*',
                        controller: _visaController.spousePostalAddressController,
                        placeholderText: 'Address',
                        helpText: _visaController.spousePostalAddressHintMessage.value.isNotEmpty
                            && _visaController.hasAttemptNextInFourthPage.value
                            ? _visaController.spousePostalAddressHintMessage.value : null,
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                  Obx(() {
                      return TextInput(
                        labelText: 'Passport number*',
                        controller: _visaController.spousePassportNumberController,
                        placeholderText: 'Passport number',
                        helpText: _visaController.spousePassportNumberHintMessage.value.isNotEmpty
                            && _visaController.hasAttemptNextInFourthPage.value
                            ? _visaController.spousePassportNumberHintMessage.value : null,
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                  Obx(() {
                      return DateInput(
                        labelText: 'Date of expiry*',
                        controller: _visaController.spouseDateOfPassportExpiryController,
                        placeholderText: 'YYYY:MM:DD',
                        helpText: _visaController.spouseDateOfPassportExpiryHintMessage.value.isNotEmpty
                            && _visaController.hasAttemptNextInFourthPage.value
                            ? _visaController.spouseDateOfPassportExpiryHintMessage.value : null,
                        lastDate: DateTime.now().add(const Duration(days: 300))
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            // Text(
            //   'Spouse details',
            //   style: CeylonScapeFont.featureAccent,
            // ),
            // const SizedBox(height: 20,),
            //
            // TextInput(
            //   labelText: 'Full Name*',
            //   controller: _visaController.spouseFullNameController,
            //   // helpText: 'Enter a valid passport number',
            //   placeholderText: 'Full name',
            // ),
            // const SizedBox(height: 20,),
            // TextInput(
            //   labelText: 'Nationality*',
            //   controller: _visaController.spouseNationalityController,
            //   // helpText: 'Enter a valid place',
            //   placeholderText: 'Nationality',
            // ),
            // const SizedBox(height: 20,),
            // TextInput(
            //   labelText: 'Postal address*',
            //   controller: _visaController.spousePostalAddressController,
            //   // helpText: 'Enter a valid place',
            //   placeholderText: 'Address',
            // ),
            // const SizedBox(height: 20,),
            // TextInput(
            //   labelText: 'Passport number*',
            //   controller: _visaController.spousePassportNumberController,
            //   // helpText: 'Enter a valid place',
            //   placeholderText: 'Passport number',
            // ),
            // const SizedBox(height: 20,),
            // DateInput(
            //   labelText: 'Date of expiry*',
            //   controller: _visaController.spouseDateOfPassportExpiryController,
            //   // helpText: 'Enter a valid date',
            //   placeholderText: 'YYYY:MM:DD',
            // ),
            // const SizedBox(height: 20,),

            Text(
              'Naturalised',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            Obx(() {
                return DateInput(
                  labelText: 'Date',
                  controller: _visaController.dateOfNaturalizedController,
                  placeholderText: 'YYYY:MM:DD',
                  helpText: _visaController.dateOfNaturalizedHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFourthPage.value
                      ? _visaController.dateOfNaturalizedHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Place of naturalised',
                  controller: _visaController.placeOfNaturalizedController,
                  placeholderText: 'Place',
                  helpText: _visaController.placeOfNaturalizedHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFourthPage.value
                      ? _visaController.placeOfNaturalizedHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Former nationality',
                  controller: _visaController.formerNationalityController,
                  placeholderText: 'Nationality',
                  helpText: _visaController.formerNationalityHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInFourthPage.value
                      ? _visaController.formerNationalityHintMessage.value : null,
                );
              }
            ),
            // const SizedBox(height: 20,),

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
                          if(_visaController.validateFourthPage()) {
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