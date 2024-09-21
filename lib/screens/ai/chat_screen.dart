import 'package:CeylonScape/controllers/chat_controller.dart';
import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:CeylonScape/widgets/ChatText.dart';
import 'package:CeylonScape/widgets/chat_input_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final TextEditingController _chatTextController = TextEditingController();
  final ChatController _chatController = Get.find();


  void _handleSendMessage(String message) {
    // do required logics
    _chatController.sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.back()),
        title: Text(
          'AI Assist',
          style: CeylonScapeFont.featureEmphasis,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() {
                return SingleChildScrollView(
                  controller: _chatController.scrollController,
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Column(
                        children: _chatController.chatMessages.value.map((chat) => Column(
                          children: [
                            ChatText(
                                type: chat.type,
                                text: chat.text
                            ),
                            const SizedBox(height: 24),
                          ],
                        )).toList(),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          ChatInputBox(
            textController: _chatTextController,
            onSendMessage: _handleSendMessage,
          )
        ],
      ),
    );
  }
}