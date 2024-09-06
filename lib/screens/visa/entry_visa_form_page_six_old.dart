import 'package:CeylonScape/controllers/visa_old_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EntryVisaFormPageSixOld extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageSixOld({super.key, required this.pageController});

  VisaOldController visaController = Get.find();

  TextEditingController emailController = TextEditingController();

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
              'Card details',
              style: CeylonScapeFont.headingLarge,
            ),
            const SizedBox(height: 32,),

            Obx(() {
                return Row(
                  children: VisaOldController.creditCardType.asMap().entries.map((type) =>
                      Row(
                          children: [
                            Radio(
                              activeColor: CeylonScapeColor.primary60,
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                              value: VisaOldController.creditCardType[type.key],
                              groupValue: visaController.selectedCreditCardType.value,
                              onChanged: (value) => visaController.selectedCreditCardType(value.toString()),
                            ),
                            const SizedBox(width: 12,),
                            Image.asset(
                              'assets/images/${VisaOldController.creditCardType[type.key]}.png',
                              width: 55,
                              height: 35,
                              fit: BoxFit.cover,
                            )
                          ])).toList()
                      .expand((widget) => [widget, const SizedBox(width: 8)])
                      .toList()
                );
              }
            ),
            const SizedBox(height: 32,),

            TextInput(
              labelText: 'Card number*',
              controller: emailController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Enter your card number',
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: DropdownInput(
                      labelText: 'Expiry date*',
                      controller: emailController,
                      options: const [
                        '01',
                        '02',
                        '03',
                        '04',
                        '05',
                        '06',
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12',
                      ]
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: DropdownInput(
                      labelText: ' ',
                      controller: emailController,
                      options: const [
                        '2024',
                        '2025',
                        '2026',
                        '2027',
                        '2028',
                        '2029',
                        '2030',
                        '2031',
                        '2032',
                        '2033',
                        '2034',
                        '2035',
                      ]
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Security code*',
              controller: emailController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Code',
            ),
            const SizedBox(height: 40,),

            Text(
              'Fingerprint for the application',
              style: CeylonScapeFont.highlightEmphasis,
            ),
            const SizedBox(height: 8,),
            TextInput(
              controller: emailController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Fingerprint',
              isTextArea: true,
            ),
            const SizedBox(height: 40,),


            Text(
              'I hereby declare that to the best of my knowledge and belief the forgoing statements are true, that I shall not engage myself in any employment, paid or unpaid, or in any business or trade other than the purpose of visa is granted,on arrival in Sri Lanka and that I shall leave Sri Lanka before the date of expiry of the period of my authorized stay in the Island. I also undertake to notify the Controller of Immigration & Emigration, Colombo, immediately any change of my address, while in Sri Lanka occurs',
              style: CeylonScapeFont.highlightEmphasis,
            ),
            const SizedBox(height: 24,),
            DateInput(
              labelText: 'Date',
              controller: emailController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 24,),
            TextInput(
              controller: emailController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Signature:',
              isTextArea: true,
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
