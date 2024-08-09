import 'package:astrology/models/astrologer/astrologer.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/default_image.dart';
import 'package:astrology/widgets/payment_options.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AastrologerIntroCard extends StatelessWidget {
  final Astrologer astrologer;
  const AastrologerIntroCard({super.key, required this.astrologer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.asset(
                        //     "assets/images/astro.jpg",
                        //     height: 150,
                        //     // width: 120,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: astrologer.profilePicture!,
                            height: 150,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const SmallCircularProgess(),
                            errorWidget: (context, url, error) =>
                                const DefaultImage(),
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
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            "${astrologer.fullname}",
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
                            child: Wrap(
                              children: astrologer.category!.map((category) {
                                final index =
                                    astrologer.category!.indexOf(category);
                                final isLast =
                                    index == astrologer.category!.length - 1;
                                return Text(
                                    '${category.name!}${isLast ? '' : ','}');
                              }).toList(),
                            ),
                          ),
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
                            child: Wrap(
                              children: astrologer.language!.map((language) {
                                final index =
                                    astrologer.language!.indexOf(language);
                                final isLast =
                                    index == astrologer.language!.length - 1;
                                return Text(
                                    '${language.name!}${isLast ? '' : ','}');
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.menu_book,
                            color: ColorUtil.colorGrey,
                          ),
                          const CustomHorizontalSpacer(width: 4),
                          Expanded(
                            child: Text(
                              "${astrologer.yearsOfExperience}",
                              style: StyleUtil.style14Grey,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const CustomVerticalSpacer(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Rs ',
                              style: StyleUtil.style16DarkBlue,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${astrologer.audioCallingRate}/min',
                                  style: StyleUtil.style14DarkBlueBold,
                                ),
                              ],
                            ),
                            style: StyleUtil.style24Black,
                          ),
                          const CustomHorizontalSpacer(width: 32),
                          const Expanded(
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
                      showPaymentOptions(context, "Chat", astrologer.chatRate!);
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
                      showPaymentOptions(
                          context, "Call", astrologer.audioCallingRate!);
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
                      showPaymentOptions(
                          context, "Video call", astrologer.videoCallingRate!);
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
