import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorUtil.colorGrey,
            width: 0.5,
          ),
        ),
      ),
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
    );
  }
}
