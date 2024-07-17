import 'dart:async';

import 'package:astrology/pages/home/home_banner_widget.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:flutter/material.dart';

class MyPager extends StatefulWidget {
  const MyPager({super.key});

  @override
  State<MyPager> createState() => _MyPagerState();
}

class _MyPagerState extends State<MyPager> {
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
        Container(
          height: 160.0,
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: pageController,
            onPageChanged: (int page) {
              updatePageChanged(page);
            },
            children: const <Widget>[
              HomeBannerWidget(),
              HomeBannerWidget(),
              HomeBannerWidget(),
            ],
          ),
        ),
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
