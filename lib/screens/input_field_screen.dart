import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/widgets/date_input.dart';
import 'package:CeylonScape/widgets/dropdown_input.dart';
import 'package:CeylonScape/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buttons")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInput(
              labelText: 'Email',
              controller: emailController,
              helpText: 'Enter a valid email',
              placeholderText: 'Enter your email/mobile',
              isObscureText: true,
            ),
            const SizedBox(height: 24,),
            DateInput(
              labelText: 'DOB',
              controller: dobController,
              placeholderText: 'YYYY:MM:DD',
            ),
            const SizedBox(height: 24,),
            DropdownInput(
                labelText: 'Gender',
                controller: genderController,
                options: const [
                  'Male',
                  'Female'
                ]
            )
          ],
        )),
      ),
    );
  }
}
