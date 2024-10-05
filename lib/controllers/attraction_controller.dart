import 'package:CeylonScape/screens/home_page.dart';
import 'package:get/get.dart';

class AttractionsController extends GetxController {
  // Reactive variable to hold the selected tag
  var selectedTag = ''.obs;

  RxList<TopAttraction> attractions = <TopAttraction>[].obs;

  // List of top attractions
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
    TopAttraction(
        location: 'Ella Rock',
        type: 'Adventure',
        duration: '4 to 5 hours',
        rating: 4.7,
        imagePath: 'ellarock.png'
    ),
    TopAttraction(
        location: 'Kitulgala',
        type: 'Adventure',
        duration: 'Full day',
        rating: 4.5,
        imagePath: 'kitulgala.png'
    ),
    TopAttraction(
        location: 'Sigiriya',
        type: 'Cultural',
        duration: '2 to 3 hours',
        rating: 4.9,
        imagePath: 'sigiriya.png'
    ),
    // TopAttraction(
    //     location: 'Temple of the Tooth',
    //     type: 'Cultural',
    //     duration: '1 to 2 hours',
    //     rating: 4.8,
    //     imagePath: 'toothofthetooth.png'
    // ),
    TopAttraction(
        location: 'Unawatuna Beach',
        type: 'Beach',
        duration: 'Half day',
        rating: 4.6,
        imagePath: 'unawatuna.png'
    ),
    TopAttraction(
        location: 'Mirissa Beach',
        type: 'Beach',
        duration: 'Half day',
        rating: 4.5,
        imagePath: 'mirissa.png'
    ),
    TopAttraction(
        location: 'Adam’s Peak',
        type: 'Mountain',
        duration: '6 to 8 hours',
        rating: 4.7,
        imagePath: 'adamspeak.png'
    ),
    TopAttraction(
        location: 'Horton Plains',
        type: 'Mountain',
        duration: '3 to 4 hours',
        rating: 4.6,
        imagePath: 'hortonplains.png'
    ),
    TopAttraction(
        location: 'Anuradhapura',
        type: 'Historical',
        duration: 'Full day',
        rating: 4.8,
        imagePath: 'anuradhapura.png'
    ),
    TopAttraction(
        location: 'Polonnaruwa',
        type: 'Historical',
        duration: 'Full day',
        rating: 4.7,
        imagePath: 'polonnaruwa.png'
    ),
    TopAttraction(
        location: 'Yala National Park',
        type: 'Wildlife',
        duration: 'Full day',
        rating: 4.6,
        imagePath: 'yala.png'
    ),
    TopAttraction(
        location: 'Udawalawe Park',
        type: 'Wildlife',
        duration: 'Full day',
        rating: 4.5,
        imagePath: 'udawalawe.png'
    ),
    TopAttraction(
        location: 'Bentota Beach',
        type: 'Beach',
        duration: 'Half day',
        rating: 4.5,
        imagePath: 'bentota.png'
    ),
    TopAttraction(
        location: 'Weligama Beach',
        type: 'Beach',
        duration: 'Half day',
        rating: 4.4,
        imagePath: 'weligama.png'
    ),
    TopAttraction(
        location: 'Knuckles',
        type: 'Mountain',
        duration: 'Full day',
        rating: 4.8,
        imagePath: 'knuckles.png'
    ),
    TopAttraction(
        location: 'Piduruthalagala',
        type: 'Mountain',
        duration: '4 to 5 hours',
        rating: 4.6,
        imagePath: 'piduruthalagala.png'
    ),
  ];
  List<String> tags = ['Adventure', 'Cultural', 'Beach', 'Mountain', 'Historical', 'Wildlife', 'Hike'];

  @override
  void onInit() {
    super.onInit();
    // Initialize the attractions list with all attractions
    attractions.addAll(topAttractions);
  }

  // Method to filter attractions based on selected tag
  List<TopAttraction> get filteredAttractions {
    if (selectedTag.value.isEmpty) {
      return topAttractions; // Return all if no tag is selected
    }
    return topAttractions
        .where((attraction) => attraction.type == selectedTag.value)
        .toList();
  }

  // Method to update selected tag
  void updateSelectedTag(String tag) {
    if (selectedTag.value == tag) {
      selectedTag.value = ''; // Deselect if the same tag is clicked again
    } else {
      selectedTag.value = tag; // Set the selected tag
    }
  }
}
