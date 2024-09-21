import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/ChatText.dart';
import 'package:CeylonScape/widgets/panel_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class ChatWidgetScreen extends StatelessWidget {
  const ChatWidgetScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Chat")),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ChatText(
              type: ChatTextType.receive,
              text: 'Hi, How can I help you?',
            ),
            const SizedBox(height: 24),
            const ChatText(
              type: ChatTextType.send,
              text: 'I need assistance on how to activate this package',
            ),
            const SizedBox(height: 24),
            Divider(
              color: CeylonScapeColor.black0.withOpacity(0.3),
              thickness: 1,
            ),
          ],
        )),
      ),

    );
  }
}
