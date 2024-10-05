import 'package:CeylonScape/screens/recommendation/recommendation_input_screen.dart';
import 'package:CeylonScape/screens/recommendation/recommendation_screen.dart';
import 'package:CeylonScape/screens/try/recommendation_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'Try our\n',
                      style: CeylonScapeFont.headingExtraLarge,
                      children: [
                        TextSpan(
                            text: 'Recommendation ',
                            style: CeylonScapeFont.headingExtraLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: CeylonScapeColor.primary50
                            )
                        ),
                        TextSpan(
                            text: 'Engine',
                            style: CeylonScapeFont.headingExtraLarge.copyWith(
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ]
                  )
              ),
            ),
            const SizedBox(height: 24,),
            Button(
              buttonText: "Try now",
              onPressed: () => Get.to(TryRecommendationScreen()),
            ),
            // const SizedBox(height: 24),
            // Button(
            //   buttonText: "Try Recommendation",
            //   onPressed: () => Get.to(RecommendationScreen()),
            // ),
          ],
        ),
      ),
    );
  }
}
