import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardDialog extends StatelessWidget {
  const CardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CeylonScapeColor.black5,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Discard Changes?',
            style: CeylonScapeFont.featureBold.copyWith(
              color: CeylonScapeColor.black
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 12,),
          Text(
            'Are you sure you want to discard the changes?',
            style: CeylonScapeFont.contentEmphasis.copyWith(
                color: CeylonScapeColor.black
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Button(
                  buttonText: "Cancel",
                  backgroundColor: CeylonScapeColor.black30,
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: Button(
                  buttonText: "Discard",
                  backgroundColor: CeylonScapeColor.error50,
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
