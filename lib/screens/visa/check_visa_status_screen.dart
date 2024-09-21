import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckVisaStatusScreen extends StatelessWidget {
  CheckVisaStatusScreen({super.key});
  final VisaController _visaController = Get.find();

  List<VisaStatusStep> stepList = [
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Applied for Visa', subTitle: 'The application and necessary documents have been submitted for processing'),
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Review', subTitle: 'The submitted application is under review by the visa authorities for evaluation'),
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Visa Decision', subTitle: 'A decision has been made regarding the approval or denial of the visa'),
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Visa Collection', subTitle: 'The approved visa is ready for collection or delivery to the applicant'),
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Visa Validation', subTitle: 'The visa has been validated and is now active for use within its specified duration'),
    VisaStatusStep(iconPath: 'assets/icons/review.svg', title: 'Departure', subTitle: 'The applicant has departed to their destination, utilizing the approved visa')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Visa Status', style: CeylonScapeFont.featureEmphasis,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CeylonScapeColor.black0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
            return AnotherStepper(
              stepperList: stepList.asMap().entries.map((entry) => StepperData(
                  title: StepperText(
                    entry.value.title,
                    textStyle: _visaController.visaApplicationStatus.value >= entry.key
                        ? CeylonScapeFont.highlightAccent
                        : CeylonScapeFont.highlightAccent.copyWith(
                      color: CeylonScapeColor.black30
                    ),
                  ),
                  subtitle: StepperText(
                      entry.value.subTitle,
                    textStyle: _visaController.visaApplicationStatus.value >= entry.key
                        ? CeylonScapeFont.contentAccent.copyWith(
                        color: CeylonScapeColor.black60
                        ) : CeylonScapeFont.contentAccent.copyWith(
                        color: CeylonScapeColor.black30
                    ),
                  ),
                  iconWidget: Container(
                    decoration: BoxDecoration(
                        color: _visaController.visaApplicationStatus.value >= entry.key
                            ? CeylonScapeColor.primary50
                            : CeylonScapeColor.black30,
                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                  ))).toList(),
              // stepperList: stepperData,
              stepperDirection: Axis.vertical,
              inverted: false,
              activeIndex: 0,
            );
          }
        ),
      ),
    );
  }
}

class VisaStatusStep {
  final String iconPath;
  final String title;
  final String subTitle;

  VisaStatusStep({required this.iconPath, required this.title, required this.subTitle});
}
