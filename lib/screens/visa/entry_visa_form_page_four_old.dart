import 'package:CeylonScape/controllers/visa_old_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaFormPageFourOld extends StatelessWidget {
  final PageController pageController;
  EntryVisaFormPageFourOld({super.key, required this.pageController});

  final VisaOldController visaController = Get.find();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        // child: Text('Hello fuckers'),
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
              'Objective of present visit',
              style: CeylonScapeFont.featureEmphasis,
            ),
            const SizedBox(height: 32,),
            Obx(() {
                return Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(
                            width: 1.5,
                            color: CeylonScapeColor.black40,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                          ),
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          activeColor: CeylonScapeColor.primary50,
                          value: visaController.objectives[0].state.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              visaController.toggleObjectiveState(0);
                            }
                          },
                        ),
                        const SizedBox(width: 12,),
                        Text(
                          visaController.objectives[0].objective,
                          style: CeylonScapeFont.highlightRegular,
                        )
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(
                            width: 1.5,
                            color: CeylonScapeColor.black40,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)
                          ),
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          activeColor: CeylonScapeColor.primary50,
                          value: visaController.objectives[1].state.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              visaController.toggleObjectiveState(1);
                            }
                          },
                        ),
                        const SizedBox(width: 12,),
                        Text(
                          visaController.objectives[1].objective,
                          style: CeylonScapeFont.highlightRegular,
                        )
                      ],
                    )
                  ],
                );
              }
            ),
            const SizedBox(height: 8,),
            Obx(() {
                return Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(
                        width: 1.5,
                        color: CeylonScapeColor.black40,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: CeylonScapeColor.primary50,
                      value: visaController.objectives[2].state.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          visaController.toggleObjectiveState(2);
                        }
                      },
                    ),
                    const SizedBox(width: 12,),
                    Text(
                      visaController.objectives[2].objective,
                      style: CeylonScapeFont.highlightRegular,
                    )
                  ],
                );
              }
            ),
            const SizedBox(height: 32,),

            TextInput(
              labelText: 'Route & mode of travel to Sri Lanka',
              controller: emailController,
              // helpText: 'Enter a valid passport number',
              placeholderText: 'Route & mode',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Period of which visit visa is required*',
              controller: emailController,
              // helpText: 'Enter a valid place',
              placeholderText: 'Time Period',
            ),
            const SizedBox(height: 40,),

            Text(
              'Whether previously in Sri Lanka? If so',
              style: CeylonScapeFont.featureEmphasis,
            ),
            const SizedBox(height: 24,),

            TextInput(
              labelText: 'Last place of residence',
              controller: emailController,
              // helpText: 'Enter a valid date',
              placeholderText: 'Address',
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of leaving',
              controller: emailController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            DropdownInput(
              labelText: 'Particulars of visa last obtained',
              controller: emailController,
              // helpText: 'Enter a valid date',
              options: const [
                'Option 1',
                'Option 2'
              ],
            ),
            const SizedBox(height: 20,),
            DateInput(
              labelText: 'Date of issue visa',
              controller: emailController,
              // helpText: 'Enter a valid date',
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'If residence visa, resident visa number',
              controller: emailController,
              // helpText: 'Enter a valid date',
              placeholderText: 'Number',
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
