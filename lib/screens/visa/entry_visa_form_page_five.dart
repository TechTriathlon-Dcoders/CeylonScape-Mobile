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
            TextInput(
              labelText: 'Period for visit visa*',
              controller: _visaController.periodForVisitVisaController,
              placeholderText: 'Period',
              isNumber: true,
            ),
            const SizedBox(height: 20,),

            Text(
              'Previously in Sri Lanka?',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            TextInput(
              labelText: 'Last place of residence*',
              controller: _visaController.lastPlaceOfResidenceController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Place',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of leaving*',
              controller: _visaController.dateOfLeavingController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            DropdownInput(
                labelText: 'Last obtained visa*',
                controller: _visaController.lastObtainedVisaTypeController,
                options: const [
                  'Entry Visa',
                  'Business Visa',
                  'Medical Visa',
                  'Transit Visa',
                  'Residence Visa',
                  'Diplomatic & Official Visa'
                ]
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of issue*',
              controller: _visaController.lastObtainedVisaDateOfIssueController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Period of validity*',
              controller: _visaController.lastObtainedVisaPeriodOfValidityController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Period',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'If resident visa - resident visa number',
              controller: _visaController.lastObtainedVisaResidenceVisaNumberController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Visa number',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Has refused a visa?',
              controller: _visaController.refusedVisaReasonController,
              // helpText: 'Enter a valid place',
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
