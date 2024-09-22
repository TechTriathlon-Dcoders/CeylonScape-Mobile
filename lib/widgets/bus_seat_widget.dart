import 'package:CeylonScape/controllers/booking_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SeatState {selected, available, booked}
enum SeatColumn {A, B, C, D, E}

class Seat {
  SeatState seatState;
  final int seatRow;
  final SeatColumn seatColumn;

  Seat({required this.seatState, required this.seatRow, required this.seatColumn});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Seat && runtimeType == other.runtimeType && seatRow == other.seatRow && seatColumn == other.seatColumn;

  @override
  int get hashCode => seatRow.hashCode ^ seatColumn.hashCode;
}

class BusSeatWidget extends StatelessWidget {
  final Seat seat;
  final BookingController _bookingController = Get.find();

  BusSeatWidget({super.key,
    required this.seat});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: seat.seatState == SeatState.selected ? CeylonScapeColor.success40 :
      seat.seatState == SeatState.available ? CeylonScapeColor.primary10 :
      CeylonScapeColor.error20,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          if(seat.seatState != SeatState.booked) {
            _bookingController.selectSeat(seat.seatRow, seat.seatColumn);
          }
        },
        borderRadius: BorderRadius.circular(8),
        highlightColor: seat.seatState != SeatState.booked ? CeylonScapeColor.primary20 : null,
        splashColor: seat.seatState != SeatState.booked ? CeylonScapeColor.primary20 : null,
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: seat.seatState == SeatState.selected ? Icon(
              Icons.check_rounded,
              size: 32,
              weight: 20,
              color: CeylonScapeColor.black0,
            ) : Text(
              '',
              style: CeylonScapeFont.headingLarger.copyWith(
                  color: CeylonScapeColor.primary50
              ),
            ),
          ),
        ),
      ),
    );
  }
}
