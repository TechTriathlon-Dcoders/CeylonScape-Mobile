import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageFiveOld extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageFiveOld({super.key, required this.pageController});

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
              'Whether permission to visit Sri Lanka or to extend stay in Sri Lanka has been refused previously and, if so by whom and when or whether application has been made now previously to any Sri Lanka visa office abroad? If so, full particulars and position of such application:',
              style: CeylonScapeFont.highlightEmphasis,
              softWrap: true,
            ),
            const SizedBox(height: 40,),

            TextInput(
              controller: emailController,
              placeholderText: 'Address',
              isTextArea: true,
              height: 240,
            ),
            // const SizedBox(height: 20,),

            Text(
              'Particulars of a person in Sri Lanka who can furnish information regarding applicant and security for maintenance and repatriation of the applicant, if so required:',
              style: CeylonScapeFont.highlightEmphasis,
              softWrap: true,
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Name',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Address',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Contact No',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Relationship',
            ),
            const SizedBox(height: 40,),

            Text(
              'Particulars of a person in Sri Lanka who can furnish information regarding applicant and security for maintenance and repatriation of the applicant, if so required:',
              style: CeylonScapeFont.highlightEmphasis,
              softWrap: true,
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Name',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Address',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Contact No',
            ),
            const SizedBox(height: 16,),
            TextInput(
              controller: emailController,
              placeholderText: 'Relationship',
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
