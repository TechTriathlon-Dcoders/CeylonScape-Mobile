import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CustomTicketWidget extends StatelessWidget {
  const CustomTicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: TicketWidget(
        width: 350,
        height: 520,
        isCornerRounded: true,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        color: CeylonScapeColor.primary5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CMB',
                      style: CeylonScapeFont.headingSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: CeylonScapeColor.primary50
                      ),
                    ),
                    Text(
                      '20 Dec 2024',
                      style: CeylonScapeFont.footnoteRegular,
                    ),
                    Text(
                      '06:00AM',
                      style: CeylonScapeFont.footnoteRegular,
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      width: 7,
                      height: 7,
                    ),
                    Text(
                      '---',
                      style: CeylonScapeFont.contentAccent.copyWith(
                          color: CeylonScapeColor.black50
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: CeylonScapeColor.primary10,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Icon(Icons.directions_train_outlined),
                ),

                Row(
                  children: [
                    Text(
                      '---',
                      style: CeylonScapeFont.contentAccent.copyWith(
                          color: CeylonScapeColor.black50
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      width: 7,
                      height: 7,
                    ),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'ELLA',
                      style: CeylonScapeFont.headingSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: CeylonScapeColor.primary50
                      ),
                    ),
                    Text(
                      '20 Dec 2024',
                      style: CeylonScapeFont.footnoteRegular,
                    ),
                    Text(
                      '10:30AM',
                      style: CeylonScapeFont.footnoteRegular,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Text(
              'Kamal Perera',
              style: CeylonScapeFont.featureEmphasis,
            ),
            const SizedBox(height: 2,),
            Text(
              '2 Adults & 1 Child',
              style: CeylonScapeFont.captionAccent,
            ),
            const SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Seat No',
                      style: CeylonScapeFont.captionAccent,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      'A4,B3,B4',
                      style: CeylonScapeFont.footnoteRegular,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ticket No',
                      style: CeylonScapeFont.captionAccent,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      'EL032',
                      style: CeylonScapeFont.footnoteRegular,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ticket Fare',
                      style: CeylonScapeFont.captionAccent,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      '\$10',
                      style: CeylonScapeFont.footnoteRegular,
                    )
                  ],
                )
              ],
            ),

            // DottedLine(dashLength: 5, dashColor: CeylonScapeColor.black30,),
            Image.asset(
              'assets/images/srilankabackground.png',
            ),
            SvgPicture.asset(
              'assets/images/barcode.svg',
            ),
          ],
        ),
      ),
    );
  }
}
