import 'package:CeylonScape/screens/main_page.dart';
import 'package:CeylonScape/screens/recommendation/recommendation_input_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool? shouldPop = await _showBackDialog(context);
        if (shouldPop ?? false) {
          Get.offAll(() => const MainPage());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () async {
              final bool? shouldPop = await _showBackDialog(context);
              if (shouldPop ?? false) {
                Get.offAll(() => const MainPage());
              }
            },
          ),
          // title: const Text(''),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.offAll(() => const MainPage());
                },
                style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                    padding: EdgeInsets.zero
                ),
                child: Text(
                  'Skip',
                  style: CeylonScapeFont.featureRegular.copyWith(
                      color: CeylonScapeColor.primary50
                  ),
                ),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: CeylonScapeColor.black0,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            // _visaController.setPage(page); // Update GetX controller when page changes
          },
          physics: const NeverScrollableScrollPhysics(),
          children: [
            RecommendationInputScreen(pageController: _pageController,),
          ],
        ),
      ),
    );
  }
}

Future<bool?> _showBackDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to leave this page?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Leave'),
            onPressed: () {
              Get.offAll(() => const MainPage());
            },
          ),
        ],
      );
    },
  );
}
