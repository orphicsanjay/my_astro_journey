import 'package:astrology/pages/home/home_astrologer_widget.dart';
import 'package:astrology/pages/home/home_astroshop_widget.dart';
import 'package:astrology/pages/home/home_banner_widget.dart';
import 'package:astrology/pages/home/home_news_articles_widget.dart';
import 'package:astrology/pages/home/home_popular_services.dart';
import 'package:astrology/pages/home/home_services_widget.dart';
import 'package:astrology/pages/home/home_search_widget.dart';
import 'package:astrology/pages/home/home_title_widget.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: const SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVerticalSpacer(height: 88),
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
          ),
        ),
      ),
    );
  }
}
