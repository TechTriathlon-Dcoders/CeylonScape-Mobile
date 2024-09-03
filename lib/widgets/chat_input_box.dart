import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSendMessage;

  const ChatInputBox({
    super.key,
    required this.textController,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            // child: TextField(
            //   controller: textController,
            //   decoration: const InputDecoration(
            //     hintText: 'Type your message...',
            //   ),
            // ),
            child: TextInput(
              labelText: 'Type your message...',
              controller: textController,
              // type: InputType.noTitle,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            decoration: const BoxDecoration(
              color: CeylonScapeColor.primary, // Set the button's background color
              shape: BoxShape.circle, // You can adjust the shape as needed
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: CeylonScapeColor.black0, // Set the icon color to white
              ),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  onSendMessage(textController.text);
                  textController.clear();
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
