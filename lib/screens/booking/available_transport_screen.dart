import 'package:CeylonScape/controllers/booking_controller.dart';
import 'package:CeylonScape/screens/booking/seat_booking_screen.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/transport_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AvailableTransportScreen extends StatelessWidget {
  AvailableTransportScreen({super.key});

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
          'Available Transport',
          style: CeylonScapeFont.featureEmphasis,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
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

              const SizedBox(height: 24,),

              ..._bookingController.availableVehicles.value.asMap().entries.map((entry) =>
                TransportWidget(
                    type: entry.value.type,
                    name: entry.value.name,
                    subType: entry.value.subType,
                    durationInMinutes: entry.value.durationInMinutes,
                    departureTime: entry.value.departureTime,
                    source: entry.value.source,
                    arrivalTime: entry.value.arrivalTime,
                    destination: entry.value.destination,
                    ratings: entry.value.ratings,
                    numberOfSheets: entry.value.numberOfSheets,
                    price: entry.value.price)
              ).toList(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: CeylonScapeColor.primary20.withOpacity(0.8),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: CeylonScapeColor.black5,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {

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
                                  color: CeylonScapeColor.black10
                                ),
                                child: Center(
                                  child: Text(
                                    'B',
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
                                    'Home Travels',
                                    style: CeylonScapeFont.featureEmphasis,
                                  ),
                                  Text(
                                    'Motor coach',
                                    style: CeylonScapeFont.captionRegular.copyWith(
                                        color: CeylonScapeColor.black40
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '04h 30m',
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
                                      '06:00AM',
                                      style: CeylonScapeFont.highlightAccent,
                                    ),
                                    Text(
                                      'Colombo',
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
                                      '10:30AM',
                                      style: CeylonScapeFont.highlightAccent,
                                    ),
                                    Text(
                                      'Ella',
                                      style: CeylonScapeFont.contentRegular,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          const Divider(color: CeylonScapeColor.black20,),
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
                                    '4.5',
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
                                    '48',
                                    style: CeylonScapeFont.highlightEmphasis.copyWith(
                                        color: CeylonScapeColor.black70
                                    ),
                                  )
                                ],
                              ),

                              Text(
                                '\$10',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum VehicleType { bus, train}

class VehicleInfo {
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

  VehicleInfo({
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
}
