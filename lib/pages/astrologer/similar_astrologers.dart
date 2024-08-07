import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class SimilarAstrologers extends StatelessWidget {
  const SimilarAstrologers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: "Check Similar Astrologers", onTap: () {}),
        const CustomVerticalSpacer(),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class SimilarAstrologerCard extends StatelessWidget {
  const SimilarAstrologerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
      child: Card(
        elevation: 2,
        color: ColorUtil.colorWhite,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: ColorUtil.colorProfileGrey,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                              color: ColorUtil.colorProfileLightGrey, width: 8),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/astrologer1.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 1,
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
                              Text("5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "Aditiya",
                style: StyleUtil.style14DarkBlueBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "Vedic/Vastu",
                style: StyleUtil.style14DarkBlue,
              ),
              const Text(
                "Rs.30/min",
                style: StyleUtil.style12Grey,
              ),
              const CustomVerticalSpacer(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: ColorUtil.colorOrange,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  "Connect",
                  style: StyleUtil.style14White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
