import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageSix extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageSix({super.key, required this.pageController});

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
              'Emergency contacts in Sri Lanka?',
              style: CeylonScapeFont.featureAccent,
            ),
            const SizedBox(height: 20,),

            TextInput(
              labelText: 'Name*',
              controller: _visaController.emergencyContactNameController,
              placeholderText: 'Name',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Address*',
              controller: _visaController.emergencyContactAddressController,
              placeholderText: 'Address',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Contact number*',
              controller: _visaController.emergencyContactContactNumberController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Contact number',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Relationship*',
              controller: _visaController.emergencyContactRelationshipController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Relationship',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'How much money in USD will the application have with him/her',
              controller: _visaController.emergencyContactBelongingMoneyAmountController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Amount',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'If credit card available- name of the card',
              controller: _visaController.emergencyContactNameOfCreditCardController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Card name',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Spendable amount',
              controller: _visaController.emergencyContactSpendableAmountController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Amount',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Any other reason to urge in support of application',
              controller: _visaController.urgeSupportReasonController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Specify the reason',
            ),
            const SizedBox(height: 20,),


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
