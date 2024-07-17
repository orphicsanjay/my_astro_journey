import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_underline_painter.dart';
import 'package:astrology/widgets/payment_options.dart';
import 'package:flutter/material.dart';

class AstrologerListCard extends StatelessWidget {
  const AstrologerListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashedBottomBorderContainer(
      dashLength: 8.0,
      dashSpacing: 4.0,
      borderColor: ColorUtil.colorGrey,
      borderWidth: 1.0,
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
                            "assets/images/astrologer2.jpeg",
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
                                  style: StyleUtil.style14DeepPurpleBold,
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
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            "Aditya Sharma",
                            style: StyleUtil.style14BlackBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          CustomHorizontalSpacer(width: 4),
                          Icon(
                            Icons.verified,
                            color: ColorUtil.colorBlue,
                          )
                        ],
                      ),
                      CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Rs ',
                              style: StyleUtil.style16DarkBlue,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '30/min',
                                  style: StyleUtil.style14DarkBlueBold,
                                ),
                              ],
                            ),
                            style: TextStyle(fontSize: 24),
                          ),
                          CustomHorizontalSpacer(width: 32),
                          Expanded(
                            child: Text(
                              "Online",
                              style: StyleUtil.style14Green,
                              textAlign: TextAlign.end,
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
                    onTap: () {
                      showPaymentOptions(context, "Chat");
                    },
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
                              color: ColorUtil.colorOrange,
                              size: 16,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text("Chat", style: StyleUtil.style14Orange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      showPaymentOptions(context, "Call");
                    },
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
                              size: 16,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text(
                              "Call",
                              style: StyleUtil.style14DarkBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      showPaymentOptions(context, "Video call");
                    },
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
                              color: ColorUtil.colorRed,
                              size: 16,
                            ),
                            CustomHorizontalSpacer(width: 4),
                            Text("Video Call", style: StyleUtil.style14Red),
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
