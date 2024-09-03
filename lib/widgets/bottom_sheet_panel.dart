import 'dart:ui';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomSheetInitiatorType {fromButton, toButton, departureTime, arrivalTime}

class BottomSheetPanel extends StatefulWidget {
  final Function(String) onClose;
  const BottomSheetPanel({super.key, this.onClose = _defaultOnClose});

  // Define a default constant function
  static void _defaultOnClose(String tone) {
  }

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();
}

class _BottomSheetPanelState extends State<BottomSheetPanel> {

  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 0.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search box
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CeylonScapeColor.black,
                  ),
                  height: 7,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextInput(
                // type: InputType.noTitle,
                labelText: 'Search Tunes ...',
                controller: searchTextController,
                onChanged: (input){
                  // setState(() {
                  //   Get.find<ServiceController>().updateSongVisibility(input);
                  // });
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}


