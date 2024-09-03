import 'package:CeylonScape/controllers/auth_controller.dart';
import 'package:CeylonScape/services/api_service.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings{
  @override
  void dependencies(){
    Get.put<AuthService>(AuthService());
    Get.put<AuthController>(AuthController());
  }
}