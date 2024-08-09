import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AstrologerShimmer extends StatelessWidget {
  const AstrologerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: List.generate(3, (index) {
    //       return const BuildAstrologerShimmer();
    //     }),
    //   ),
    // );
    return ListView.builder(
      itemCount: 2, // Adjust the count as needed
      itemBuilder: (context, index) {
        return const BuildAstrologerShimmer();
      },
    );
  }
}

class BuildAstrologerShimmer extends StatelessWidget {
  const BuildAstrologerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      color: ColorUtil.colorWhite,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 150,
                      width: 120,
                      color: ColorUtil.colorBlack,
                    ),
                  ),
                ),
                const CustomHorizontalSpacer(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorUtil.colorBlack,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.35,
                          color: ColorUtil.colorBlack,
                        ),
                      ),
                    ),
                    const CustomVerticalSpacer(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorUtil.colorBlack,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.35,
                          color: ColorUtil.colorBlack,
                        ),
                      ),
                    ),
                    const CustomVerticalSpacer(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorUtil.colorBlack,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.25,
                          color: ColorUtil.colorBlack,
                        ),
                      ),
                    ),
                    const CustomVerticalSpacer(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorUtil.colorBlack,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 4,
                          width: 50,
                          color: ColorUtil.colorBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const CustomVerticalSpacer(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return const BuildBottomButton();
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildBottomButton extends StatelessWidget {
  const BuildBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          width: 100,
          height: 40,
          decoration: BoxDecoration(
              color: ColorUtil.colorBlack,
              borderRadius: BorderRadius.circular(24.0)),
        ),
      ),
    );
  }
}
