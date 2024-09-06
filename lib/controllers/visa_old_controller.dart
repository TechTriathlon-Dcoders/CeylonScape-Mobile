import 'package:get/get.dart';

class VisaOldController extends GetxController {
  RxInt visaApplicationFormCurrentPage = 0.obs;
  RxList<TouristObjective> objectives = <TouristObjective>[
    TouristObjective(objective: 'Tourist', state: false),
    TouristObjective(objective: 'Applied for resident visa', state: false),
    TouristObjective(objective: 'Other Purposes', state: false),
  ].obs;
  static const List<String> creditCardType = ['visa', 'american_express', 'master'];
  var selectedCreditCardType = creditCardType[0].obs;

  void setPage(int page) {
    visaApplicationFormCurrentPage.value = page;
  }

  double getFormHeight() {
    if (visaApplicationFormCurrentPage.value == 0) {
      return 400;
    } else if (visaApplicationFormCurrentPage.value == 1){
      return 1520;
    } else {
      return 850;
    }
  }

  void reSetFormPage() {
    Future.delayed(const Duration(seconds: 2), () {
      visaApplicationFormCurrentPage.value = 0;
    });
  }

  void toggleObjectiveState(int index) {
    objectives[index].state.value = !objectives[index].state.value;
  }

  void setSelectedCreditCardType(String value) {
    selectedCreditCardType.value = value;
  }
}

class TouristObjective {
  final String objective;
  final RxBool state;

  TouristObjective({required this.objective, required bool state})
      : state = state.obs;
}