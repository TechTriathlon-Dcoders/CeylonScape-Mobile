import 'package:CeylonScape/screens/visa/visa_menu_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisaGetStartedScreen extends StatelessWidget {
  const VisaGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Start your\n',
                  style: CeylonScapeFont.headingExtraLarge,
                  children: [
                    TextSpan(
                      text: 'Visa ',
                      style: CeylonScapeFont.headingExtraLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: CeylonScapeColor.primary50
                      )
                    ),
                    TextSpan(
                        text: 'Application',
                        style: CeylonScapeFont.headingExtraLarge.copyWith(
                            fontWeight: FontWeight.w700,
                        )
                    ),
                    TextSpan(
                        text: '\nnow',
                        style: CeylonScapeFont.headingExtraLarge
                    ),
                  ]
                )
              ),
            ),
            const SizedBox(height: 72,),
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Get Started",
                onPressed: () => Get.to(
                    VisaMenuScreen(),
                  transition: Transition.rightToLeft
                )),
            const SizedBox(height: 72,),
            SizedBox(
              width: 250,
              child: Text(
                'Get your e-Visa in just a few easy steps.',
                style: CeylonScapeFont.contentEmphasis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
