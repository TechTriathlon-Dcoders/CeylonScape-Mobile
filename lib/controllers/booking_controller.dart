import 'package:CeylonScape/screens/booking/available_transport_screen.dart';
import 'package:CeylonScape/widgets/bus_seat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class BookingController extends GetxController{
  final TextEditingController departureFromController = TextEditingController();
  final TextEditingController arrivalAtController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final RxBool hasAttemptNextInFirstPage = false.obs;
  RxString departureFromHintMessage = ''.obs;
  RxString arrivalAtHintMessage = ''.obs;
  RxString departureDateHintMessage = ''.obs;
  RxInt adultCount = 0.obs;
  RxInt childCount = 0.obs;
  RxList<VehicleInfo> availableVehicles = [
    VehicleInfo(
      type: VehicleType.bus,
      name: 'Home Travels',
      subType: 'Motor coach',
      durationInMinutes: 270,
      departureTime: DateTime(0, 1, 1, 6, 30),
      source: 'Colombo',
      arrivalTime: DateTime(0, 1, 1, 10, 30),
      destination: 'Ella',
      ratings: 4.5,
      numberOfSheets: 48,
      price: 10
    ),
    VehicleInfo(
        type: VehicleType.bus,
        name: 'Home Travels',
        subType: 'Motor coach',
        durationInMinutes: 270,
        departureTime: DateTime(0, 1, 1, 6, 30),
        source: 'Colombo',
        arrivalTime: DateTime(0, 1, 1, 10, 30),
        destination: 'Ella',
        ratings: 4.5,
        numberOfSheets: 48,
        price: 10
    ),
    VehicleInfo(
        type: VehicleType.bus,
        name: 'Home Travels',
        subType: 'Motor coach',
        durationInMinutes: 270,
        departureTime: DateTime(0, 1, 1, 6, 30),
        source: 'Colombo',
        arrivalTime: DateTime(0, 1, 1, 10, 30),
        destination: 'Ella',
        ratings: 4.5,
        numberOfSheets: 48,
        price: 10
    ),
    VehicleInfo(
        type: VehicleType.bus,
        name: 'Home Travels',
        subType: 'Motor coach',
        durationInMinutes: 270,
        departureTime: DateTime(0, 1, 1, 6, 30),
        source: 'Colombo',
        arrivalTime: DateTime(0, 1, 1, 10, 30),
        destination: 'Ella',
        ratings: 4.5,
        numberOfSheets: 48,
        price: 10
    ),
  ].obs;
  RxList<Seat> seats = <Seat>[].obs;
  List<Seat> boockedSeats = [
    Seat(seatState: SeatState.booked, seatRow: 1, seatColumn: SeatColumn.A),
    Seat(seatState: SeatState.booked, seatRow: 2, seatColumn: SeatColumn.D),
    Seat(seatState: SeatState.booked, seatRow: 4, seatColumn: SeatColumn.C),
    Seat(seatState: SeatState.booked, seatRow: 4, seatColumn: SeatColumn.D),
    Seat(seatState: SeatState.booked, seatRow: 7, seatColumn: SeatColumn.D),
    Seat(seatState: SeatState.booked, seatRow: 8, seatColumn: SeatColumn.A),
    Seat(seatState: SeatState.booked, seatRow: 8, seatColumn: SeatColumn.B),
  ];

  @override
  void onInit() {
    super.onInit();
    initializeSeats();
    departureFromController.text = 'Colombo';
    arrivalAtController.text = 'Ella';
  }

  void increaseAdultCount() {
    adultCount.value++;
  }
  void increaseChildCount() {
    childCount.value++;
  }
  void decreaseAdultCount() {
    adultCount.value = max(adultCount.value-1, 0);
  }
  void decreaseChildCount() {
    childCount.value = max(childCount.value-1, 0);
  }

  // Initialize the seat list (example for a 3x3 grid)
  void initializeSeats() {
    for (int row = 1; row <= 11; row++) {
      for (var column in SeatColumn.values) {
        if (boockedSeats.contains(Seat(seatState: SeatState.booked, seatRow: row, seatColumn: column))) {
          seats.add(Seat(seatState: SeatState.booked,
              seatRow: row,
              seatColumn: column));
        } else {
          seats.add(Seat(seatState: SeatState.available,
              seatRow: row,
              seatColumn: column));
        }
      }
    }
  }

  // Update seat state to 'selected' based on row and column
  void selectSeat(int row, SeatColumn column) {
    final seatIndex = seats.indexWhere((seat) => seat.seatRow == row && seat.seatColumn == column);
    if (seatIndex != -1) {
      seats[seatIndex].seatState = (seats[seatIndex].seatState == SeatState.available) ? SeatState.selected : SeatState.available;
      seats.refresh(); // Notify GetX that the list has been updated
    }
  }


  void interChangeLocations() {
    String temp = departureFromController.text;
    departureFromController.text = arrivalAtController.text;
    arrivalAtController.text = temp;
  }
}
