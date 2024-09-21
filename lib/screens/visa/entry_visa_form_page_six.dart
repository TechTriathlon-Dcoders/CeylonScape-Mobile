import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/screens/main_page.dart';
import 'package:CeylonScape/screens/recommendation/recommendation_screen.dart';
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

            Obx(() {
                return TextInput(
                  labelText: 'Name*',
                  controller: _visaController.emergencyContactNameController,
                  placeholderText: 'Name',
                  helpText: _visaController.emergencyContactNameHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSixthPage.value
                      ? _visaController.emergencyContactNameHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Address*',
                  controller: _visaController.emergencyContactAddressController,
                  placeholderText: 'Address',
                  helpText: _visaController.emergencyContactAddressHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSixthPage.value
                      ? _visaController.emergencyContactAddressHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Contact number*',
                  controller: _visaController.emergencyContactContactNumberController,
                  placeholderText: 'Contact number',
                  helpText: _visaController.emergencyContactContactNumberHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSixthPage.value
                      ? _visaController.emergencyContactContactNumberHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            Obx(() {
                return TextInput(
                  labelText: 'Relationship*',
                  controller: _visaController.emergencyContactRelationshipController,
                  placeholderText: 'Relationship',
                  helpText: _visaController.emergencyContactRelationshipHintMessage.value.isNotEmpty
                      && _visaController.hasAttemptNextInSixthPage.value
                      ? _visaController.emergencyContactRelationshipHintMessage.value : null,
                );
              }
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'How much money in USD will the application have with him/her',
              controller: _visaController.emergencyContactBelongingMoneyAmountController,
              placeholderText: 'Amount',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'If credit card available- name of the card',
              controller: _visaController.emergencyContactNameOfCreditCardController,
              placeholderText: 'Card name',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Spendable amount',
              controller: _visaController.emergencyContactSpendableAmountController,
              placeholderText: 'Amount',
              isNumber: true,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Any other reason to urge in support of application',
              controller: _visaController.urgeSupportReasonController,
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
                        onPressed: () async {
                          if(_visaController.validateSixthPage()) {
                            await _showConfirmDialog(context, _visaController);
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

Future<bool?> _showConfirmDialog(BuildContext context, VisaController visaController) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to submit this form?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Submit'),
            onPressed: () {
              visaController.apply().then((value) {
                if (value) {
                  Get.offAll(() => RecommendationScreen());
                  Get.snackbar(
                    icon: const Icon(
                      Icons.check_circle,
                      size: 26,
                      color: CeylonScapeColor.success40,
                    ),
                    shouldIconPulse: true,
                    "Success",
                    "Successfully applied for VISA",
                    colorText: CeylonScapeColor.black,
                  );
                }
              });
            },
          ),
        ],
      );
    },
  );
}
