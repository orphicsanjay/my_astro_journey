import 'package:astrology/pages/home/home_astrologer_widget.dart';
import 'package:astrology/pages/home/home_astroshop_widget.dart';
import 'package:astrology/pages/home/home_banner_widget.dart';
import 'package:astrology/pages/home/home_news_articles_widget.dart';
import 'package:astrology/pages/home/home_popular_services.dart';
import 'package:astrology/pages/home/home_search_widget.dart';
import 'package:astrology/pages/home/home_services_widget.dart';
import 'package:astrology/pages/home/home_title_widget.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomVerticalSpacer(height: 32),
        HomeTitleWidget(),
        CustomVerticalSpacer(),
        HomeSearchWidget(),
        CustomVerticalSpacer(),
        HomePopularServicesWidget(),
        CustomVerticalSpacer(),
        HomeBannerWidget(),
        CustomVerticalSpacer(),
        HomeAstrologerWidget(),
        CustomVerticalSpacer(),
        HomeServicesWidget(),
        CustomVerticalSpacer(),
        HomeAstroShopWidget(),
        CustomVerticalSpacer(),
        HomeNewsArticlesWidget(),
        CustomVerticalSpacer(),
      ],
    );
  }
}
