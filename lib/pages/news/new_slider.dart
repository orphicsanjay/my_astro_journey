import 'dart:async';

import 'package:astrology/pages/news/news_banner_image.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class NewsSlider extends StatefulWidget {
  const NewsSlider({super.key});

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? timer;

  void updatePageChanged(int page) {
    currentPage = page;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  updatePageChanged(page);
                },
                children: const <Widget>[
                  NewsBannerImage(),
                  NewsBannerImage(),
                  NewsBannerImage(),
                ],
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("How to book a pujari on Astro Journey",
                          style: StyleUtil.style14White),
                      Text(
                        "5th Jan, 2024",
                        style: StyleUtil.style12Orange,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const CustomVerticalSpacer(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => buildDot(index, context)),
        ),
      ],
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index
            ? ColorUtil.colorDarkBlue
            : ColorUtil.colorWhite,
        border: Border.all(color: ColorUtil.colorDarkBlue, width: 1),
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    pageController.dispose();
    super.dispose();
  }
}
