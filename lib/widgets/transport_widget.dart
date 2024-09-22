import 'package:CeylonScape/screens/booking/available_transport_screen.dart';
import 'package:CeylonScape/screens/booking/seat_booking_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransportWidget extends StatelessWidget {
  final VehicleType type;
  final String name;
  final String subType;
  final int durationInMinutes;
  final DateTime departureTime;
  final String source;
  final DateTime arrivalTime;
  final String destination;
  final double ratings;
  final int numberOfSheets;
  final double price;

  const TransportWidget({super.key,
    required this.type,
    required this.name,
    required this.subType,
    required this.durationInMinutes,
    required this.departureTime,
    required this.source,
    required this.arrivalTime,
    required this.destination,
    required this.ratings,
    required this.numberOfSheets,
    required this.price});

  String formatDuration(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = remainingMinutes.toString().padLeft(2, '0');

    return '${formattedHours}h ${formattedMinutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1.5,
              color: CeylonScapeColor.primary20
            )
          ),
          child: Material(
            color: CeylonScapeColor.black0,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {
                Get.to(SeatBookingScreen());
              },
              borderRadius: BorderRadius.circular(16),
              highlightColor: CeylonScapeColor.primary5,
              splashColor: CeylonScapeColor.primary5,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: CeylonScapeColor.primary10
                          ),
                          child: Center(
                            child: Text(
                              type == VehicleType.bus ? 'B' : 'T',
                              style: CeylonScapeFont.headingLarger.copyWith(
                                  color: CeylonScapeColor.primary50
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: CeylonScapeFont.featureEmphasis,
                            ),
                            Text(
                              subType,
                              style: CeylonScapeFont.captionRegular.copyWith(
                                  color: CeylonScapeColor.black40
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          formatDuration(durationInMinutes),
                          style: CeylonScapeFont.featureEmphasis.copyWith(
                              color: CeylonScapeColor.primary60
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                DateFormat('hh:mma').format(departureTime),
                                style: CeylonScapeFont.highlightAccent,
                              ),
                              Text(
                                source,
                                style: CeylonScapeFont.contentRegular,
                              )
                            ],
                          ),

                          Text(
                            '----->',
                            style: CeylonScapeFont.contentAccent.copyWith(
                                color: CeylonScapeColor.black50
                            ),
                          ),

                          Column(
                            children: [
                              Text(
                                DateFormat('hh:mma').format(arrivalTime),
                                style: CeylonScapeFont.highlightAccent,
                              ),
                              Text(
                                destination,
                                style: CeylonScapeFont.contentRegular,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    const DottedLine(dashLength: 8, dashColor: CeylonScapeColor.black10,),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 18,
                              width: 18,
                              fit: BoxFit.none,
                            ),
                            const SizedBox(width: 3,),
                            Text(
                              ratings.toStringAsFixed(1),
                              style: CeylonScapeFont.highlightEmphasis.copyWith(
                                  color: CeylonScapeColor.black70
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: CeylonScapeColor.black70,
                            ),
                            const SizedBox(width: 3,),
                            Text(
                              numberOfSheets.toString(),
                              style: CeylonScapeFont.highlightEmphasis.copyWith(
                                  color: CeylonScapeColor.black70
                              ),
                            )
                          ],
                        ),

                        Text(
                          '\$${price..toStringAsFixed(2)}',
                          style: CeylonScapeFont.highlightEmphasis.copyWith(
                              color: CeylonScapeColor.black70
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24,)
      ],
    );
  }
}
