import 'package:CeylonScape/controllers/booking_controller.dart';
import 'package:CeylonScape/screens/booking/available_transport_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/card.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final BookingController _bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.back()),
        title: Text(
          'Book your Bus',
          style: CeylonScapeFont.featureEmphasis,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCard(
                type: CardType.light,
                borderRadius: 12,
                border: Border.all(
                  width: 1,
                  color: CeylonScapeColor.black10
                ),
                // backgroundColor: CeylonScapeColor.black5,
                showShadow: false,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextInput(
                        labelText: 'From*',
                        controller: _bookingController.departureFromController,
                        placeholderText: 'Choose Departure from',
                        helpText: _bookingController.departureFromHintMessage.value.isNotEmpty
                            && _bookingController.hasAttemptNextInFirstPage.value
                            ? _bookingController.departureFromHintMessage.value : null,
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: CeylonScapeColor.primary50.withOpacity(0.3),
                              offset: const Offset(0, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                          ]
                        ),
                        child: Material(
                          color: CeylonScapeColor.primary50,
                          borderRadius: BorderRadius.circular(50),
                          child: InkWell(
                            onTap: () {
                              _bookingController.interChangeLocations();
                            },
                            borderRadius: BorderRadius.circular(50),
                            highlightColor: CeylonScapeColor.primary20,
                            splashColor: CeylonScapeColor.primary20,
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/icons/interchange.svg'
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextInput(
                        labelText: 'To*',
                        controller: _bookingController.arrivalAtController,
                        placeholderText: 'Choose Arrival at',
                        helpText: _bookingController.arrivalAtHintMessage.value.isNotEmpty
                            && _bookingController.hasAttemptNextInFirstPage.value
                            ? _bookingController.arrivalAtHintMessage.value : null,
                      ),
                      const SizedBox(height: 20,),
                      DateInput(
                        labelText: 'Departure Date*',
                        controller: _bookingController.departureDateController,
                        placeholderText: 'YYYY:MM:DD',
                        lastDate: DateTime.now(),
                        helpText: _bookingController.departureDateHintMessage.value.isNotEmpty
                            && _bookingController.hasAttemptNextInFirstPage.value
                            ? _bookingController.departureDateHintMessage.value : null,
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adult (12+)',
                            style: CeylonScapeFont.contentRegular,
                          ),

                          Row(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      _bookingController.decreaseAdultCount();
                                    },
                                    icon: const Icon(
                                      Icons.remove
                                    )
                                ),
                                Container(
                                  width: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: CeylonScapeColor.black30
                                    )
                                  ),
                                  child: Obx(() {
                                      return Text(
                                        _bookingController.adultCount.toString(),
                                        style: CeylonScapeFont.featureRegular.copyWith(
                                          color: CeylonScapeColor.black30
                                        ),
                                        textAlign: TextAlign.center,
                                      );
                                    }
                                  ),
                                ),
                                IconButton(
                                    onPressed: (){
                                      _bookingController.increaseAdultCount();
                                    },
                                    icon: const Icon(
                                        Icons.add
                                    )
                                ),
                              ],
                          )
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Child (2-12)',
                            style: CeylonScapeFont.contentRegular,
                          ),

                          Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                    _bookingController.decreaseChildCount();
                                  },
                                  icon: const Icon(
                                      Icons.remove
                                  )
                              ),
                              Container(
                                width: 60,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1,
                                        color: CeylonScapeColor.black30
                                    )
                                ),
                                child: Obx(() {
                                    return Text(
                                      _bookingController.childCount.toString(),
                                      style: CeylonScapeFont.featureRegular.copyWith(
                                          color: CeylonScapeColor.black30
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  }
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    _bookingController.increaseChildCount();
                                  },
                                  icon: const Icon(
                                      Icons.add
                                  )
                              ),
                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24,),

              Button(
                  type: ButtonType.primaryColor,
                  buttonText: "Search Buses",
                  onPressed: () {
                    _bookingController.hasAttemptNextInFirstPage.value = true;
                    Get.to(
                        AvailableTransportScreen(),
                        transition: Transition.rightToLeft
                    );
                  }),

              const SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
