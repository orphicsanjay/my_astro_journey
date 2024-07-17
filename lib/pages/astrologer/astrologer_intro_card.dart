import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class AastrologerIntroCard extends StatelessWidget {
  const AastrologerIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 170,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/astro.jpg",
                            height: 150,
                            // width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorUtil.colorWhite,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,
                                    color: ColorUtil.colorRatingYellow),
                                Text(
                                  "5",
                                  style: StyleUtil.style14DeepPurple,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomHorizontalSpacer(width: 12),
                const Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Aditya Sharma",
                            style: StyleUtil.style16BlackBold,
                          )),
                          CustomHorizontalSpacer(width: 4),
                          Icon(
                            Icons.verified,
                            color: ColorUtil.colorBlue,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book,
                            color: ColorUtil.colorGrey,
                          ),
                          CustomHorizontalSpacer(width: 4),
                          Expanded(
                              child: Text(
                            "Vasthu consultation, Vedic Astrology",
                            style: StyleUtil.style14Grey,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.sort_by_alpha,
                            color: ColorUtil.colorGrey,
                          ),
                          CustomHorizontalSpacer(width: 4),
                          Expanded(
                              child: Text(
                            "Nepali, English, Hindi",
                            style: StyleUtil.style14Grey,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book,
                            color: ColorUtil.colorGrey,
                          ),
                          CustomHorizontalSpacer(width: 4),
                          Expanded(
                            child: Text(
                              "8 years",
                              style: StyleUtil.style14Grey,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Rs ',
                              style: StyleUtil.style16DarkBlue,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '30/min',
                                  style: StyleUtil.style16DarkBlueBold,
                                ),
                              ],
                            ),
                            style: TextStyle(fontSize: 24),
                          ),
                          CustomHorizontalSpacer(width: 32),
                          Expanded(
                            child: Text(
                              "Online",
                              style: StyleUtil.style16Green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomVerticalSpacer(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: ColorUtil.colorLightOrange,
                              size: 20.0,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text("Chat", style: StyleUtil.style12Orange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: ColorUtil.colorDarkBlue,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text("Call", style: StyleUtil.style12DarkBlue),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videocam,
                              color: ColorUtil.colorOrange,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text("Video Call", style: StyleUtil.style12Orange),
                          ],
                        ),
                      ),
                    ),
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
