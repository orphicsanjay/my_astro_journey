import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AstrologerShimmer extends StatelessWidget {
  const AstrologerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // return const SingleChildScrollView(
    //   child: Row(
    //     children: [
    //       BuildAstrologerShimmer(),
    //       CustomHorizontalSpacer(),
    //       BuildAstrologerShimmer(),
    //       CustomHorizontalSpacer(),
    //       BuildAstrologerShimmer(),
    //       CustomHorizontalSpacer(),
    //     ],
    //   ),
    // );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          return const BuildAstrologerShimmer();
        }),
      ),
    );
  }
}

class BuildAstrologerShimmer extends StatelessWidget {
  const BuildAstrologerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: ColorUtil.colorBlack,
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                width: 100,
                color: ColorUtil.colorBlack,
              ),
            ),
            const CustomVerticalSpacer(height: 8),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 8,
                width: 70,
                color: ColorUtil.colorBlack,
              ),
            ),
            const CustomVerticalSpacer(height: 8),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 8,
                width: 40,
                color: ColorUtil.colorBlack,
              ),
            ),
            const CustomVerticalSpacer(height: 16),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: ColorUtil.colorBlack,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  height: 16,
                  width: 32,
                  color: ColorUtil.colorBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
