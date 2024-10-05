import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/501route.svg',
            ),
            const SizedBox(height: 24,),
            Center(
              child: Text(
                'Journey Delayed!',
                style: CeylonScapeFont.headingLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: CeylonScapeColor.primary50
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24,),
            Center(
              child: Text(
                'This route is still being mapped out.',
                style: CeylonScapeFont.highlightEmphasis,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Soon, it’ll be worth the wait!',
                style: CeylonScapeFont.highlightEmphasis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
