import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_underline_painter.dart';
import 'package:astrology/widgets/payment_options.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DashedBottomBorderContainer(
      dashLength: 8.0,
      dashSpacing: 4.0,
      borderColor: ColorUtil.colorGrey,
      borderWidth: 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/astrologer2.jpeg",
                        height: 150,
                        // width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const CustomHorizontalSpacer(width: 16),
                const Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ",
                        style: StyleUtil.style14BlackBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomVerticalSpacer(height: 4),
                      Text(
                        "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ",
                        style: StyleUtil.style14Black,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomVerticalSpacer(height: 4),
                      Text(
                        "5th Jan, 2024",
                        style: StyleUtil.style12Orange,
                      ),
                      CustomVerticalSpacer(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
