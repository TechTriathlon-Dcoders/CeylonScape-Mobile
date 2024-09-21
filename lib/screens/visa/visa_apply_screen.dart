import 'package:CeylonScape/screens/visa/entry_visa_form.dart';
import 'package:CeylonScape/screens/visa/visa_menu_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VisaApplyScreen extends StatelessWidget {
  const VisaApplyScreen({super.key});

  static List<VisaMenuItem> visaMenuItems = [
    VisaMenuItem(
        label: 'Entry Visa',
        icon: 'visa-type-1.svg',
        route: EntryVisaForm()
    ),
    VisaMenuItem(
        label: 'Business Visa',
        icon: 'visa-type-2.svg',
        route: EntryVisaForm()
    ),
    VisaMenuItem(
        label: 'Medical Visa',
        icon: 'visa-type-3.svg',
        route: EntryVisaForm()
    ),
    VisaMenuItem(
        label: 'Transit Visa',
        icon: 'visa-type-4.svg',
        route: EntryVisaForm()
    ),
    VisaMenuItem(
        label: 'Residence Visa',
        icon: 'visa-type-5.svg',
        route: EntryVisaForm()
    ),
    VisaMenuItem(
        label: 'Diplomatic and \nOfficial Visa',
        icon: 'visa-type-6.svg',
        route: EntryVisaForm()
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
                            text: 'Visa Type',
                            style: CeylonScapeFont.headingLarger.copyWith(
                              fontWeight: FontWeight.w700,
                              color: CeylonScapeColor.primary50
                            )
                        ),
                      ]
                  )
              ),
            ),
            const SizedBox(height: 32,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 520,
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
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                visaMenuItems[index].route,
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
          ],
        ),
      ),
    );;
  }
}
