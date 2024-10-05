import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/screens/visa/visa_menu_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UnImplementedScreen extends StatelessWidget {
  UnImplementedScreen({super.key});

  final VisaController _visaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.back()),
        title: const Text(''),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CeylonScapeColor.black0,
      ),
      body: Container(
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
