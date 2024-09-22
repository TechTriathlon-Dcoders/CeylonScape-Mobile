import 'dart:ffi';

import 'package:CeylonScape/controllers/booking_controller.dart';
import 'package:CeylonScape/screens/booking/ticket_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/bus_seat_widget.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeatBookingScreen extends StatelessWidget {
  SeatBookingScreen({super.key});

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
          'Book seats',
          style: CeylonScapeFont.featureEmphasis,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24,),
                  Column(
                    children: [
                      Text(
                        '20 December 2024',
                        style: CeylonScapeFont.featureRegular,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'CMB',
                                style: CeylonScapeFont.headingExtraLarge.copyWith(
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                'Colombo, WP',
                                style: CeylonScapeFont.footnoteRegular,
                              )
                            ],
                          ),

                          Text(
                            '-----',
                            style: CeylonScapeFont.contentAccent.copyWith(
                                color: CeylonScapeColor.black50
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: CeylonScapeColor.black10,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Icon(Icons.directions_train_outlined),
                          ),

                          Text(
                            '-----',
                            style: CeylonScapeFont.contentAccent.copyWith(
                                color: CeylonScapeColor.black50
                            ),
                          ),

                          Column(
                            children: [
                              Text(
                                'ELLA',
                                style: CeylonScapeFont.headingExtraLarge.copyWith(
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                'Ella, UP',
                                style: CeylonScapeFont.footnoteRegular,
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '04h 30m',
                        style: CeylonScapeFont.featureRegular,
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        '2 Adults & 1 Child',
                        style: CeylonScapeFont.captionAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 48,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: CeylonScapeColor.success20,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: CeylonScapeColor.success40.withOpacity(0.3),
                                  offset: const Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '',
                                style: CeylonScapeFont.headingLarger.copyWith(
                                    color: CeylonScapeColor.primary50
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Text(
                            'Selected',
                            style: CeylonScapeFont.contentRegular,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: CeylonScapeColor.primary10,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: CeylonScapeColor.primary20.withOpacity(0.3),
                                  offset: const Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '',
                                style: CeylonScapeFont.headingLarger.copyWith(
                                    color: CeylonScapeColor.primary50
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Text(
                            'Available',
                            style: CeylonScapeFont.contentRegular,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: CeylonScapeColor.error30,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: CeylonScapeColor.error30.withOpacity(0.3),
                                  offset: const Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '',
                                style: CeylonScapeFont.headingLarger.copyWith(
                                    color: CeylonScapeColor.primary50
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Text(
                            'Booked',
                            style: CeylonScapeFont.contentRegular,
                          )
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 24,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: SeatColumn.values.map((value) => Text(
                        value.name,
                        style: CeylonScapeFont.featureAccent,
                    )).toList(),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    height: 800,
                    child: Obx(() {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: SeatColumn.values.length,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: _bookingController.seats.length,
                        itemBuilder: (context, index) {
                          final seat = _bookingController.seats[index];
                          final bool isLastRow = seat.seatRow == 11;

                          // Skip adding seats to the last row unless it's column C
                          if (!isLastRow && seat.seatColumn == SeatColumn.C) {
                            return Center(
                              child: Text(
                                seat.seatRow.toString(),
                                style: CeylonScapeFont.featureAccent,
                              ),
                            ); // Return an empty container for non-column-C seats in the last row
                          }

                          return BusSeatWidget(
                            seat: seat,
                          );
                        },
                      );
                    }),
                  ),

                  // Button(
                  //     type: ButtonType.primaryColor,
                  //     buttonText: "Confirm & Pay",
                  //     onPressed: () {
                  //       _bookingController.hasAttemptNextInFirstPage.value = true;
                  //       Get.to(
                  //           TicketScreen(),
                  //           transition: Transition.rightToLeft
                  //       );
                  //     }),

                  const SizedBox(height: 64,),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Button(
                  type: ButtonType.primaryColor,
                  buttonText: "Confirm & Pay",
                  onPressed: () {
                    _bookingController.hasAttemptNextInFirstPage.value = true;
                    Get.to(
                        TicketScreen(),
                        transition: Transition.rightToLeft
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
