import 'package:CeylonScape/controllers/visa_old_controller.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_five.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_four.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_one.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_six.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_three.dart';
import 'package:CeylonScape/screens/visa/entry_visa_form_page_two.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/card_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryVisaForm extends StatelessWidget {
  EntryVisaForm({super.key});
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController scrollController = ScrollController();
  // final VisaController _visaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool? shouldPop = await _showBackDialog(context);
        if (shouldPop ?? false) {
          navigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              // showDialog(
              //     context: context,
              //     builder: (_) => const CardDialog()
              // );
              // Get.back();
              // Navigator.pop(context);
              // _visaController.reSetFormPage();
            },
          ),
          title: const Text(''),
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
            EntryVisaFormPageOne(pageController: _pageController,),
            EntryVisaFormPageTwo(pageController: _pageController,),
            EntryVisaFormPageThree(pageController: _pageController,),
            EntryVisaFormPageFour(pageController: _pageController,),
            EntryVisaFormPageFive(pageController: _pageController,),
            EntryVisaFormPageSix(pageController: _pageController,),
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
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}
