import 'package:CeylonScape/dto/visa/visa_response.dart';
import 'package:get/get.dart';

class VisaService extends GetxService {
  Rx<int>? visaApplicationID;
  Rx<String> fullName = ''.obs;
  Rx<String> email = ''.obs;

  int getVisaApplicationID(){
    return visaApplicationID!.value;
  }

  String getFullName(){
    return fullName!.value;
  }

  String getEmail(){
    return email!.value;
  }

  Future<void> setUserInfo(VisaResponse visaResponse) async{
    visaApplicationID = visaResponse.id.obs;
    fullName = visaResponse.fullName.obs;
    email = visaResponse.email.obs;
  }
}