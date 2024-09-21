import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/screens/main_page.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationInputScreen extends StatelessWidget {
  final PageController pageController;
  RecommendationInputScreen({super.key, required this.pageController});
  final VisaController _visaController = Get.find();
  final AuthService _authService = Get.find();

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
                      text: 'Tailor Your\n',
                      style: CeylonScapeFont.headingLarger,
                      children: [
                        TextSpan(
                            text: 'Travel Experience',
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

            TextInput(
              labelText: 'Name*',
              controller: _visaController.fullNameController,
              placeholderText: 'Name',
              isProhibitedEdit: true,
              initialValue: _authService.getFullName(),
              // helpText: _visaController.emailHintMessage.value.isNotEmpty
              //     && _visaController.hasAttemptNextInSecondPage.value
              //     ? _visaController.emailHintMessage.value : null,
            ),
            const SizedBox(height: 20,),
            TextInput(
              labelText: 'Email*',
              controller: _visaController.emailController,
              placeholderText: 'Email',
              isProhibitedEdit: true,
              initialValue: _authService.getEmail(),
              // helpText: _visaController.emailHintMessage.value.isNotEmpty
              //     && _visaController.hasAttemptNextInSecondPage.value
              //     ? _visaController.emailHintMessage.value : null,
            ),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select your preferred activities',
                  style: CeylonScapeFont.contentRegular,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right_outlined),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DraggableScrollableSheet(
                              expand:  false,
                              builder: (BuildContext context, ScrollController scrollController) {
                                return Container(
                                  // padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(28.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only( left: 24, right: 24, top: 16, bottom: 8),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: CeylonScapeColor.black30,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 4,
                                                width: 32,
                                                decoration: const BoxDecoration(
                                                  color: CeylonScapeColor.black30,
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                )
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Activity',
                                                  style: CeylonScapeFont.headingSmall,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context); // Closes the modal bottom sheet
                                                  },
                                                  style: TextButton.styleFrom(
                                                      overlayColor: Colors.transparent,
                                                      padding: EdgeInsets.zero
                                                  ),
                                                  child: Text(
                                                    'Done',
                                                    style: CeylonScapeFont.featureRegular.copyWith(
                                                        color: CeylonScapeColor.primary50
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Expanded(
                                        child: ListView.builder(
                                          controller: scrollController,
                                          itemCount: _visaController.preferredActivities.length,
                                          itemBuilder: (BuildContext context, int i) {
                                            return ListTile(
                                              horizontalTitleGap: 16,
                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),  // Removes all padding
                                              leading: Obx(() {
                                                return Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: CeylonScapeColor.black,
                                                  ),
                                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  value: _visaController.preferredActivities[i].values.first,
                                                  onChanged: (newValue) => _visaController.setPreferredActivity(
                                                    _visaController.preferredActivities[i].keys.first,
                                                    newValue!,
                                                  ),
                                                  activeColor: CeylonScapeColor.primary50,
                                                );
                                              }),
                                              title: Text(
                                                _visaController.preferredActivities[i].keys.first,
                                                style: CeylonScapeFont.highlightRegular,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        });
                  },
                )
              ],
            ),
            // const SizedBox(height: 12,),
            // Display selected chips
            Obx(() {
              return Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _visaController.getCheckedActivities().map((activity) {
                  return Chip(
                    label: Text(activity, style: CeylonScapeFont.contentAccent,),
                    deleteIcon: const Icon(Icons.close, size: 18, color: CeylonScapeColor.black40,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // Custom border radius
                      side: const BorderSide(
                        color: CeylonScapeColor.primary50, // Custom border color
                        width: 1.5, // Border width
                      ),
                    ),
                    onDeleted: () {
                      // Deselect the item when delete icon is pressed
                      _visaController.setPreferredActivity(activity, false);
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select your bucket list of places',
                  style: CeylonScapeFont.contentRegular,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right_outlined),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DraggableScrollableSheet(
                              expand:  false,
                              builder: (BuildContext context, ScrollController scrollController) {
                                return Container(
                                  // padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(28.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only( left: 24, right: 24, top: 16, bottom: 8),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: CeylonScapeColor.black30,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 4,
                                                width: 32,
                                                decoration: const BoxDecoration(
                                                  color: CeylonScapeColor.black30,
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                )
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Places',
                                                  style: CeylonScapeFont.headingSmall,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context); // Closes the modal bottom sheet
                                                  },
                                                  style: TextButton.styleFrom(
                                                      overlayColor: Colors.transparent,
                                                      padding: EdgeInsets.zero
                                                  ),
                                                  child: Text(
                                                    'Done',
                                                    style: CeylonScapeFont.featureRegular.copyWith(
                                                        color: CeylonScapeColor.primary50
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Expanded(
                                        child: ListView.builder(
                                          controller: scrollController,
                                          itemCount: _visaController.preferredBucketList.length,
                                          itemBuilder: (BuildContext context, int i) {
                                            return ListTile(
                                              horizontalTitleGap: 16,
                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),  // Removes all padding
                                              leading: Obx(() {
                                                return Checkbox(
                                                  side: const BorderSide(
                                                    width: 1,
                                                    color: CeylonScapeColor.black,
                                                  ),
                                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  value: _visaController.preferredBucketList[i].values.first,
                                                  onChanged: (newValue) => _visaController.setBucketList(
                                                    _visaController.preferredBucketList[i].keys.first,
                                                    newValue!,
                                                  ),
                                                  activeColor: CeylonScapeColor.primary50,
                                                );
                                              }),
                                              title: Text(
                                                _visaController.preferredBucketList[i].keys.first,
                                                style: CeylonScapeFont.highlightRegular,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        });
                  },
                )
              ],
            ),
            // const SizedBox(height: 12,),
            // Display selected chips
            Obx(() {
              return Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _visaController.getCheckedBucketList().map((place) {
                  return Chip(
                    label: Text(place, style: CeylonScapeFont.contentAccent,),
                    deleteIcon: const Icon(Icons.close, size: 18, color: CeylonScapeColor.black40,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // Custom border radius
                      side: const BorderSide(
                        color: CeylonScapeColor.primary50, // Custom border color
                        width: 1.5, // Border width
                      ),
                    ),
                    onDeleted: () {
                      // Deselect the item when delete icon is pressed
                      _visaController.setBucketList(place, false);
                    },
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 32,),
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Expanded(
                  //   child: Button(
                  //       type: ButtonType.primaryColor,
                  //       buttonText: "Back",
                  //       onPressed: () {
                  //         pageController.previousPage(
                  //           duration: const Duration(milliseconds: 20),
                  //           curve: Curves.easeInOut,
                  //         );
                  //       }),
                  // ),
                  // const SizedBox(width: 12,),
                  Expanded(
                    child: Button(
                        type: ButtonType.primaryColor,
                        buttonText: "Submit",
                        onPressed: () async {
                          await _showConfirmDialog(context, _visaController);
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32,),
          ]
        ),
      ),
    );
  }
}

Future<bool?> _showConfirmDialog(BuildContext context, VisaController visaController) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to submit this?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Get.back(result: false);
              // Navigator.pop(context, false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Submit'),
            onPressed: () {
              visaController.applyRecommendations().then((value) {
                if (value) {
                  Get.offAll(() => const MainPage());
                  Get.snackbar(
                    icon: const Icon(
                      Icons.check_circle,
                      size: 26,
                      color: CeylonScapeColor.success40,
                    ),
                    shouldIconPulse: true,
                    "Success",
                    "You will receive recommendations in the Email",
                    colorText: CeylonScapeColor.black,
                    backgroundColor: CeylonScapeColor.black0,
                    boxShadows: [
                      BoxShadow(
                        color: CeylonScapeColor.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 4.5), // changes position of shadow
                      )
                    ]
                  );
                }
              });
            },
          ),
        ],
      );
    },
  );
}
