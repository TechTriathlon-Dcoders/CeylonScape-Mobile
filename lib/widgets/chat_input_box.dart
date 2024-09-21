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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: CeylonScapeColor.black5,
          borderRadius: BorderRadius.circular(36)
        ),
        child: Row(
          children: [
            Expanded(
              child: TextInput(
                placeholderText: 'Ask me anything',
                controller: textController,
                isEnableBorder: false,
                isFocusBorder: false,
                fillColor: const Color(0xffF7F7F7),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 42,
              width: 42,
              decoration: const BoxDecoration(
                color: Color(0xFF3856E7), // Set the button's background color
                shape: BoxShape.circle, // You can adjust the shape as needed
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.send_outlined,
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
      ),
    );
  }
}
