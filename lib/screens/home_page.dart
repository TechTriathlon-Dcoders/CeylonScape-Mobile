import 'dart:async';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/banner_slider.dart';
import 'package:CeylonScape/widgets/card.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  int _currentBannerIndex = 0;

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentBannerIndex < 2) {
        _carouselController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _carouselController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24.0, top: 56),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Hello',
                          style: CeylonScapeFont.headingMedium.copyWith(
                            color: CeylonScapeColor.primary50
                          ),
                        ),
                        Text(
                          'What are you looking for?',
                          style: CeylonScapeFont.headingMedium,
                        )
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/notifications.svg',
                        height: 24,
                        width: 24,
                      ),
                      onPressed: () {
                        // Handle notification bell press
                      },
                    )
                  ],
                ),
                Container(
                  color: CeylonScapeColor.black0,
                  child: const Text('Home Page'),
                )
              ],
            )),
      ),
    );
  }
}
