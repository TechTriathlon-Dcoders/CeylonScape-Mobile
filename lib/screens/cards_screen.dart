import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/dynamic_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/card.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(context) {

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Cards")),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                  type: CardType.light,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      "Light card",
                      style: TextStyle(color: CeylonScapeColor.black, fontSize: 16),
                    ),
                  ))),
            ],
          )),
        ),
      ),
    );
  }
}
