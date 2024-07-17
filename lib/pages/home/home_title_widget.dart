import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/person.jpg'),
        ),
        CustomHorizontalSpacer(),
        Text.rich(
          TextSpan(
            text: 'Hello,\n',
            style: StyleUtil.style16DarkBlue,
            children: <TextSpan>[
              TextSpan(
                text: 'Aditya',
                style: StyleUtil.style20DarkBlueBold,
              ),
            ],
          ),
          style: TextStyle(fontSize: 24),
        ),
        CustomHorizontalSpacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.card_giftcard,
                color: ColorUtil.colorOrange,
              ),
              CustomHorizontalSpacer(),
              Icon(
                Icons.notifications,
                color: ColorUtil.colorOrange,
              ),
              CustomHorizontalSpacer(),
              Icon(
                Icons.shopping_cart,
                color: ColorUtil.colorOrange,
              ),
              CustomHorizontalSpacer(),
            ],
          ),
        ),
      ],
    );
  }
}
