import 'package:CeylonScape/screens/home_page.dart';
import 'package:CeylonScape/screens/profile_page.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'component_screen.dart';

class NavLink {
  final String icon;
  final String label;

  NavLink({required this.icon, required this.label});
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<MainPage> {

  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final AuthService _authService = Get.find();

  @override
  void initState() {
    super.initState();

    // Your initialization code or method invocation goes here
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<NavLink> navLinks = [
    NavLink(icon: 'assets/icons/home.svg', label: 'Home'),
    NavLink(icon: 'assets/icons/ai.svg', label: 'Ai'),
    NavLink(icon: 'assets/icons/trip.svg', label: 'Trip'),
    NavLink(icon: 'assets/icons/profile.svg', label: 'Profile'),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          '',
          style: CeylonScapeFont.featureEmphasis,
        ),
        centerTitle: true,
        toolbarHeight: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
          ProfilePage(),
          // HomePage(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(left: 36, right: 36, bottom: 12),
          decoration: BoxDecoration(
              color: CeylonScapeColor.primary30,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff1A9BE3).withOpacity(0.6),
                  offset: const Offset(0, 4),
                  blurRadius: 18,
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                navLinks.length,
                    (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: SizedBox(
                    height: 45,
                    width: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          navLinks[index].icon, // Update the path to your SVG file
                          height: 28,
                          width: 28,
                          color: _currentIndex == index
                              ? CeylonScapeColor.primary80
                              : CeylonScapeColor.primary5,
                        ),
                        Text(
                          navLinks[index].label,
                          style: CeylonScapeFont.captionAccent.copyWith(
                              color: _currentIndex == index
                                  ? CeylonScapeColor.primary80
                                  : CeylonScapeColor.primary5
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
