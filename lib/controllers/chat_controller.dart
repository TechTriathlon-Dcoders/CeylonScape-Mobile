import 'package:CeylonScape/widgets/ChatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  final ScrollController scrollController = ScrollController();
  RxList<ChatText> chatMessages = <ChatText>[].obs;

  void sendMessage(String userMessage) {
    chatMessages.add(ChatText(type: ChatTextType.send, text: userMessage));
    String response = generateResponse(userMessage);
    chatMessages.add(ChatText(type: ChatTextType.receive, text: response));
    _scrollToBottom();
  }

  String generateResponse(String userMessage) {
    if (userMessage.toLowerCase().contains("tickets")) {
      return "Sure! Travelling from Colombo to Galle is a popular route, and there are two main transport options available: bus and train. Let me guide you through the details for both.";
    }
    return "Sorry, I didn't understand that.";
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
}