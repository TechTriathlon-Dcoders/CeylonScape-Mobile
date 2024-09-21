import 'package:CeylonScape/controllers/signin_controller.dart';
import 'package:CeylonScape/controllers/signup_controller.dart';
import 'package:CeylonScape/controllers/visa_controller.dart';
import 'package:CeylonScape/controllers/visa_old_controller.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/services/visa_service.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings{
  @override
  void dependencies(){
    // Get.put<AuthService>(AuthService());
    Get.put<VisaService>(VisaService());
    Get.put<SignInController>(SignInController());
    Get.put<SignUpController>(SignUpController());
    Get.put<VisaOldController>(VisaOldController());
    Get.put<VisaController>(VisaController());
  }
}