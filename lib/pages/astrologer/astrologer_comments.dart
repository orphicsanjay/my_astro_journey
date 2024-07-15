import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class AstrologerReviews extends StatelessWidget {
  const AstrologerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          const AstrologerComment(),
          Container(
            height: 1,
            color: ColorUtil.colorGrey,
            margin: const EdgeInsets.symmetric(vertical: 12),
          ),
          const AstrologerComment(),
          Container(
            height: 1,
            color: ColorUtil.colorGrey,
            margin: const EdgeInsets.symmetric(vertical: 12),
          ),
          const AstrologerComment(),
          const CustomVerticalSpacer(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "See all reviews",
                style: StyleUtil.style14GreenBold,
              ),
              Icon(
                Icons.east,
                color: ColorUtil.colorGreen,
              )
            ],
          ),
          const CustomVerticalSpacer(height: 8),
        ],
      ),
    );
  }
}

class AstrologerComment extends StatelessWidget {
  const AstrologerComment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
          CustomHorizontalSpacer(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Anonymous",
                style: StyleUtil.style14BlackBold,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorOrange,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorOrange,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorOrange,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorOrange,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorOrange,
                  ),
                ],
              ),
              CustomVerticalSpacer(height: 8),
              Text(
                "Amazing astrologer mostly all doubts are clear",
                style: StyleUtil.style14Black,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
