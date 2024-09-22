import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:CeylonScape/screens/main_page.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/button.dart';
import 'package:CeylonScape/widgets/custom_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key});
  GlobalKey _globalKey = GlobalKey();

  // Function to capture the widget and save it as an image
  Future<void> _captureAndDownload() async {
    try {
      // Ensure permissions to store files
      await Permission.storage.request();

      // Find the RenderRepaintBoundary using the key
      RenderRepaintBoundary boundary = _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

      // Capture the image as an Image object
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      // Convert the Image object to byte data
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to a file
      final directory = (await getApplicationDocumentsDirectory()).path;
      File imgFile = File('$directory/snapshot.png');
      await imgFile.writeAsBytes(pngBytes);

      // Convert the file path to XFile and share using shareXFiles
      XFile xFile = XFile(imgFile.path);
      Share.shareXFiles([xFile], text: 'Check out this snapshot!');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CeylonScapeColor.primary,
          titleSpacing: 0,
          leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: CeylonScapeColor.black0,),
              onPressed: () => Get.back()),
          title: Text(
            'Ticket Details',
            style: CeylonScapeFont.featureEmphasis.copyWith(
              color: CeylonScapeColor.black0
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: CeylonScapeColor.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                ),
                child: Column(
                  children: [
                    const CustomTicketWidget(),
                    const SizedBox(height: 30,),
                    Button(
                        type: ButtonType.primaryColor,
                        buttonText: "Download E-Ticket",
                        onPressed: () {
                          Get.offAll(
                              const MainPage(),
                              transition: Transition.rightToLeft
                          );
                        }),
                  ],
                ),
              ),

              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Track your Bus',
                  style: CeylonScapeFont.featureAccent,
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Provides real-time bus tracking, allowing users to see the exact location and arrival times of their buses, ensuring a smooth and stress-free commute',
                  style: CeylonScapeFont.contentRegular,
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Button(
                    type: ButtonType.primaryColor,
                    buttonText: "Track",
                    onPressed: () {
                      Get.offAll(
                          const MainPage(),
                          transition: Transition.rightToLeft
                      );
                    }),
              ),
            ],
          ),
        )
    );
  }
}
