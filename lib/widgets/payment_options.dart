// utils/payment_options.dart

import 'package:flutter/material.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';

void showPaymentOptions(BuildContext context, String action) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                '$action with Astrologer',
                style: StyleUtil.style16DarkBlueBold,
                textAlign: TextAlign.center,
              ),
            ),
            const CustomVerticalSpacer(height: 16),
            const Text(
              'Aditya Sharma',
              style: StyleUtil.style16BlackBold,
            ),
            const CustomVerticalSpacer(height: 16),
            const Text(
              'Rs. 500',
              style: StyleUtil.style14Black,
            ),
            const CustomVerticalSpacer(height: 16),
            const Text(
              'Select payment method',
              style: StyleUtil.style14Black,
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16),
              color: ColorUtil.colorGreen,
            ),
            const Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/esewa.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Esewa',
                      style: StyleUtil.style14Black,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtil.colorGrey,
                  size: 16.0,
                )
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16),
              color: ColorUtil.colorGreen,
            ),
            const Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/khalti.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Khalti',
                      style: StyleUtil.style14Black,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtil.colorGrey,
                  size: 16.0,
                )
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16),
              color: ColorUtil.colorGreen,
            ),
          ],
        ),
      );
    },
  );
}
