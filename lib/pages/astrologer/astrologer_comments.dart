import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class AstrologerReviews extends StatelessWidget {
  const AstrologerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Rating overview",
              textAlign: TextAlign.start,
              style: StyleUtil.style14Black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Column(
                  children: [
                    Text("5", style: StyleUtil.style24BlackBold),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorUtil.colorRatingYellow,
                        ),
                        Icon(
                          Icons.star,
                          color: ColorUtil.colorRatingYellow,
                        ),
                        Icon(
                          Icons.star,
                          color: ColorUtil.colorRatingYellow,
                        ),
                        Icon(
                          Icons.star,
                          color: ColorUtil.colorRatingYellow,
                        ),
                        Icon(
                          Icons.star,
                          color: ColorUtil.colorRatingYellow,
                        ),
                      ],
                    ),
                    Text("384 Ratings", style: StyleUtil.style14Grey),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("5", style: StyleUtil.style14Black),
                          const CustomHorizontalSpacer(),
                          CustomRatingBar(
                              width: size.width * 0.4,
                              height: 8,
                              progress: 0.7),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("4", style: StyleUtil.style14Black),
                          const CustomHorizontalSpacer(),
                          CustomRatingBar(
                              width: size.width * 0.4,
                              height: 8,
                              progress: 0.4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("3", style: StyleUtil.style14Black),
                          const CustomHorizontalSpacer(),
                          CustomRatingBar(
                              width: size.width * 0.4,
                              height: 8,
                              progress: 0.3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("2", style: StyleUtil.style14Black),
                          const CustomHorizontalSpacer(),
                          CustomRatingBar(
                              width: size.width * 0.4,
                              height: 8,
                              progress: 0.2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("1", style: StyleUtil.style14Black),
                          const CustomHorizontalSpacer(),
                          CustomRatingBar(
                              width: size.width * 0.4,
                              height: 8,
                              progress: 0.1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomVerticalSpacer(),
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
                    color: ColorUtil.colorRatingYellow,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorRatingYellow,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorRatingYellow,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorRatingYellow,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.colorRatingYellow,
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
