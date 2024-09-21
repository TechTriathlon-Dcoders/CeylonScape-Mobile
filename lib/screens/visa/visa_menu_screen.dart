import 'package:CeylonScape/screens/visa/check_visa_status_screen.dart';
import 'package:CeylonScape/screens/visa/visa_apply_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VisaMenuScreen extends StatelessWidget {
  const VisaMenuScreen({super.key});

  static List<VisaMenuItem> visaMenuItems = [
    VisaMenuItem(
      label: 'Apply for \nE-Visa',
      icon: 'visa-menu-1.svg',
      route: VisaApplyScreen()
    ),
    VisaMenuItem(
        label: 'Check Visa \nStatus',
        icon: 'visa-menu-2.svg',
        route: CheckVisaStatusScreen()
    ),
    VisaMenuItem(
        label: 'Visa \nInformation',
        icon: 'visa-menu-3.svg',
        route: VisaApplyScreen()
    ),
    VisaMenuItem(
        label: 'Help and \nSupport',
        icon: 'visa-menu-4.svg',
        route: VisaApplyScreen()
    ),
  ];

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
        // padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'Select your\n',
                      style: CeylonScapeFont.headingLarger,
                      children: [
                        TextSpan(
                            text: 'Next ',
                            style: CeylonScapeFont.headingLarger.copyWith(
                                fontWeight: FontWeight.w700,
                            )
                        ),
                        TextSpan(
                            text: 'Step',
                            style: CeylonScapeFont.headingLarger.copyWith(
                              color: CeylonScapeColor.primary50,
                              fontWeight: FontWeight.w700,
                            )
                        )
                      ]
                  )
              ),
            ),
            const SizedBox(height: 32,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 364,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 24.0,
                  mainAxisSpacing: 24.0,
                  childAspectRatio: 18 / 15
                ),
                itemCount: visaMenuItems.length, // 4 items for 2x2 grid
                itemBuilder: (context, index) {
                  return CustomCard(
                    type: CardType.light,
                    showShadow: true,
                    borderRadius: 12,
                    border: Border.all(
                        width: 2,
                        color: CeylonScapeColor.primary10
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CeylonScapeColor.black0,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => visaMenuItems[index].route,
                              transition: Transition.rightToLeft
                            );
                          },
                          highlightColor: CeylonScapeColor.primary10,
                          splashColor: CeylonScapeColor.primary5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/${visaMenuItems[index].icon}',
                                height: 39,
                              ),
                              const SizedBox(height: 16,),
                              Text(
                                visaMenuItems[index].label,
                                style: CeylonScapeFont.contentAccent,
                                textAlign: TextAlign.center,
                                softWrap: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24,),
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

class VisaMenuItem {
  final String label;
  final String icon;
  final Widget route;

  VisaMenuItem({required this.label, required this.icon, required this.route});
}
