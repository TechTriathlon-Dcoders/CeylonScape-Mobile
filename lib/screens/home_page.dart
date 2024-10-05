import 'dart:async';
import 'package:CeylonScape/controllers/attraction_controller.dart';
import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/screens/ai/chat_screen.dart';
import 'package:CeylonScape/screens/booking/booking_screen.dart';
import 'package:CeylonScape/screens/component_screen.dart';
import 'package:CeylonScape/screens/try/recommendation_screen.dart';
import 'package:CeylonScape/screens/try/unimplemented_screen.dart';
import 'package:CeylonScape/screens/visa/visa_get_started_screen.dart';
import 'package:CeylonScape/screens/visa/visa_menu_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final VisaController _visaController = Get.find();
  final AttractionsController _attractionsController = Get.find();

  // List<QuickAccessItem> quickAccessItems = [];

  @override
  void initState() {
    super.initState();
    print(_visaController.isGetStartedScreenSeen.value);
  }

  List<SearchItem> items = [
    SearchItem(label: 'Visa', route: VisaGetStartedScreen()),
    SearchItem(label: 'Booking', route: BookingScreen()),
    SearchItem(label: 'Help and support', route: ChatScreen()),
    SearchItem(label: 'Travel recommendations', route: TryRecommendationScreen()),
  ];
  List<QuickAccessItem> quickAccessItems = [
    QuickAccessItem(label: 'Plan your Trip', icon: '1.svg', route: UnImplementedScreen()),
    QuickAccessItem(label: 'Apply Visa', icon: '2.svg', route: VisaGetStartedScreen()),
    QuickAccessItem(label: 'Book by Train/Bus', icon: '3.svg', route: BookingScreen()),
    QuickAccessItem(label: 'Chat with AI Assistant', icon: '4.svg', route: ChatScreen()),
  ];
  List<TopAttraction> topAttractions = [
    TopAttraction(
      location: 'Nine Arch Brid...',
      type: 'Hike',
      duration: '3 to 4 hours',
      rating: 4.8,
      imagePath: 'ninearch.png'
    ),
    TopAttraction(
      location: 'Lipton Seat',
      type: 'Hike',
      duration: '1 hours',
      rating: 4.3,
      imagePath: 'liptonseat.png'
    ),
  ];
  List<NewsItem> newsItems = [
    NewsItem(
        title: 'Top Destinations to Explore',
        imagePath: 'news1.png',
        description: 'Discover the hottest travel spots for 2024, from hidden gems to must-see cities worldwide.',
        time: '6h ago'
    ),
    NewsItem(
        title: 'Top Places to Kayaking',
        imagePath: 'news2.png',
        description: 'Discover the hottest travel spots for 2024, from hidden gems to must-see cities worldwide.',
        time: '4h ago'
    ),
  ];
  List<String> tags = ['Adventure ', 'Cultural', 'Beach', 'Mountain', 'Historical', 'Wildlife', 'Hike'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24.0, top: 64),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Greeting Section */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
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
              ),
              const SizedBox(
                height: 32,
              ),


              /* Weather Information Section */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CeylonScapeColor.black5,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: CeylonScapeColor.primary20
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You are currently in',
                        style: CeylonScapeFont.highlightRegular.copyWith(
                          color: CeylonScapeColor.black50
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Colombo, Sri Lanka',
                        style: CeylonScapeFont.headingSmall.copyWith(
                          color: CeylonScapeColor.primary60
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '27°C Sunny',
                            style: CeylonScapeFont.featureRegular.copyWith(
                              color: CeylonScapeColor.primary50
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/icons/weather_sunny.svg',
                            height: 24,
                            width: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),


              /* Searchbar Section */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CSSearchBar(
                  controller: searchController,
                  searchItems: items,
                ),
              ),
              const SizedBox(
                height: 32,
              ),


              /* Quick Access Section */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: quickAccessItems.map((item) =>
                      GestureDetector(
                        onTap: () {
                          if (item.label == 'Apply Visa') {
                            Get.to(
                              _visaController.isGetStartedScreenSeen.value
                                  ? const VisaMenuScreen()
                                  : VisaGetStartedScreen(),
                            );
                          } else {
                            // For other items, navigate to the predefined route
                            Get.to(item.route);
                          }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => item.route),
                          // );
                        },
                        child: Column(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/quick_access/${item.icon}',
                                    height: 64,
                                    width: 64,
                                    fit: BoxFit.scaleDown
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  width: 78,
                                  child: Text(
                                    item.label,
                                    style: CeylonScapeFont.captionEmphasis,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                        ),
                      )
                  ).toList(),
                ),
              ),
              const SizedBox(height: 32),

              /* Top Attraction Section */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Top Attractions',
                  style: CeylonScapeFont.headingSmall,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                    return Row(
                      children: [
                        const SizedBox(width: 24),
                        ...tags.asMap().entries.map((entry) => GestureDetector(
                          onTap: () {
                            _attractionsController.updateSelectedTag(entry.value);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                color: _attractionsController.selectedTag.value == entry.value
                                ? CeylonScapeColor.primary50 : CeylonScapeColor.black0,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 1,
                                    color: _attractionsController.selectedTag.value == entry.value
                                    ? CeylonScapeColor.black0 : CeylonScapeColor.black40
                                )
                            ),
                            child: Text(
                              entry.value,
                              style: _attractionsController.selectedTag.value == entry.value
                              ? CeylonScapeFont.contentRegular.copyWith(
                                color: CeylonScapeColor.black0
                              ) : CeylonScapeFont.contentRegular,
                            ),
                          ),
                        )).toList()
                        .expand((widget) => [widget, const SizedBox(width: 8)])
                        .toList()
                      ],
                    );
                  }
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                    return Row(
                      children: [
                        const SizedBox(width: 24),

                        ..._attractionsController.filteredAttractions.map((place) => Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  'assets/images/${place.imagePath}',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 17,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    place.location,
                                    style: CeylonScapeFont.highlightAccent,
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    'assets/icons/star.svg',
                                    width: 19.06,
                                    height: 18,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    place.rating.toString(),
                                    style: CeylonScapeFont.contentEmphasis.copyWith(
                                        color: CeylonScapeColor.black80
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                place.type,
                                style: CeylonScapeFont.captionRegular.copyWith(
                                  color: CeylonScapeColor.black40
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                'Duration : ${place.type}',
                                style: CeylonScapeFont.captionRegular.copyWith(
                                    color: CeylonScapeColor.black40
                                ),
                              )
                            ],
                          ),
                        )).toList()
                        .expand((widget) => [widget, const SizedBox(width: 20)])
                        .toList(),

                        // ...topAttractions.map((place) => Container(
                        //   width: 200,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.circular(16.0),
                        //         child: Image.asset(
                        //           'assets/images/${place.imagePath}',
                        //           width: 200,
                        //           height: 200,
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //       const SizedBox(height: 17,),
                        //       Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             place.location,
                        //             style: CeylonScapeFont.highlightAccent,
                        //           ),
                        //           const Spacer(),
                        //           SvgPicture.asset(
                        //             'assets/icons/star.svg',
                        //             width: 19.06,
                        //             height: 18,
                        //           ),
                        //           const SizedBox(width: 5,),
                        //           Text(
                        //             place.rating.toString(),
                        //             style: CeylonScapeFont.contentEmphasis.copyWith(
                        //                 color: CeylonScapeColor.black80
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //       const SizedBox(height: 8,),
                        //       Text(
                        //         place.type,
                        //         style: CeylonScapeFont.captionRegular.copyWith(
                        //             color: CeylonScapeColor.black40
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8,),
                        //       Text(
                        //         'Duration : ${place.type}',
                        //         style: CeylonScapeFont.captionRegular.copyWith(
                        //             color: CeylonScapeColor.black40
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )).toList()
                        //     .expand((widget) => [widget, const SizedBox(width: 20)])
                        //     .toList(),
                      ]
                    );
                  }
                ),
              ),


              /* Offers Section */
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Offers',
                      style: CeylonScapeFont.headingSmall,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View more',
                              style: CeylonScapeFont.contentEmphasis.copyWith(
                                color: CeylonScapeColor.primary60
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_rounded,
                              size: 24,
                              color: CeylonScapeColor.primary50,
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/seaside.png',
                    width: 363,
                    height: 176,
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              /* News Section */

              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Travel News',
                  style: CeylonScapeFont.headingSmall,
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: newsItems.map((newsItem) => Container(
                    decoration: BoxDecoration(
                        color: CeylonScapeColor.black0,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1,
                            color: CeylonScapeColor.black10
                        )
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 170,
                                child: Text(
                                  newsItem.title,
                                  style: CeylonScapeFont.contentAccent,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 9,),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  newsItem.description,
                                  style: CeylonScapeFont.footnoteRegular,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text(
                                newsItem.time,
                                style: CeylonScapeFont.footnoteRegular.copyWith(
                                    color: CeylonScapeColor.primary60
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/${newsItem.imagePath}',
                            height: 151,
                            width: 131,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  )).toList()
                  .expand((widget) => [widget, const SizedBox(height: 12)])
                  .toList()
                  // children: [
                  //   Container(
                  //     decoration: BoxDecoration(
                  //       color: CeylonScapeColor.black0,
                  //       borderRadius: BorderRadius.circular(12),
                  //       border: Border.all(
                  //         width: 1,
                  //         color: CeylonScapeColor.black10
                  //       )
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               SizedBox(
                  //                 width: 170,
                  //                 child: Text(
                  //                   'Top Destinations to Explore',
                  //                   style: CeylonScapeFont.contentAccent,
                  //                   softWrap: true,
                  //                 ),
                  //               ),
                  //               const SizedBox(height: 9,),
                  //               SizedBox(
                  //                 width: 170,
                  //                 child: Text(
                  //                   'Discover the hottest travel spots for 2024, from hidden gems to must-see cities worldwide.',
                  //                   style: CeylonScapeFont.footnoteRegular,
                  //                   softWrap: true,
                  //                 ),
                  //               ),
                  //               SizedBox(height: 9,),
                  //               Text(
                  //                 '6h ago',
                  //                 style: CeylonScapeFont.footnoteRegular.copyWith(
                  //                   color: CeylonScapeColor.primary60
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         const Spacer(),
                  //         ClipRRect(
                  //           borderRadius: BorderRadius.circular(12),
                  //           child: Image.asset(
                  //             'assets/images/news1.png',
                  //             height: 151,
                  //             width: 131,
                  //             fit: BoxFit.cover,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   )
                  // ],
                ),
              ),
              const SizedBox(height: 64),
            ],
          )),
    );
  }
}

class QuickAccessItem {
  final String label;
  final String icon;
  final Widget route;

  QuickAccessItem({required this.label, required this.icon, required this.route});
}

class TopAttraction {
  final String location;
  final String type;
  final String duration;
  final double rating;
  final String imagePath;

  TopAttraction({
  required this.location,
  required this.type,
  required this.duration,
  required this.rating,
  required this.imagePath
  });
}

class NewsItem {
  final String title;
  final String imagePath;
  final String description;
  final String time;

  NewsItem({required this.title, required this.imagePath, required this.description, required this.time});
}
