import 'package:CeylonScape/bindings/all_bindings.dart';
import 'package:CeylonScape/controllers/screen_controller.dart';
import 'package:CeylonScape/screens/splash_screen.dart';
import 'package:CeylonScape/services/auth_service.dart';
import 'package:CeylonScape/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AuthService
  final AuthService authService = Get.put(AuthService());
  await authService.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ScreenController _screenController = Get.put(ScreenController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Change status bar icon color to white
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: 'CeylonScape',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
