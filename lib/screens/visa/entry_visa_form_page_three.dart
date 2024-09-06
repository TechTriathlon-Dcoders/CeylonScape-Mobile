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

            TextInput(
              labelText: 'Number*',
              controller: _visaController.passportNumberController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Number',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Place of issue*',
              controller: _visaController.placeOfPassportIssueController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Place',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of issue*',
              controller: _visaController.dateOfPassportIssueController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of expiry*',
              controller: _visaController.dateOfPassportExpiryController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),

            Text(
              'Previous Passport',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            TextInput(
              labelText: 'Number*',
              controller: _visaController.previousPassportNumberController,
              // helpText: 'Enter a valid date',
              placeholderText: 'Number',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Place of issue*',
              controller: _visaController.placeOfPreviousPassportIssueController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Place',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of issue*',
              controller: _visaController.dateOfPreviousPassportIssueController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of expiry*',
              controller: _visaController.dateOfPreviousPassportExpiryController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
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
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 20),
                            curve: Curves.easeInOut,
                          );
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

List<String> countries = [
  'India',
  'Russia',
  'United Kingdom',
  'Germany',
  'France',
  'China',
  'Australia',
  'United States',
  'Canada',
  'Japan',
  'Switzerland',
  'Spain',
  'Maldives',
  'Netherlands',
  'Israel',
  'Italy',
  'Poland',
  'Bangladesh',
  'Czech Republic',
  'Malaysia'
];
