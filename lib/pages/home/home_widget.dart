import 'package:astrology/bloc/appservice/appservice_bloc.dart';
import 'package:astrology/bloc/appservice/appservice_event.dart';
import 'package:astrology/bloc/shop/shop_bloc.dart';
import 'package:astrology/bloc/shop/shop_event.dart';
import 'package:astrology/locator.dart';
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

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getIt<AppServiceBloc>().add(FetchAppServices());
        getIt<ShopBloc>().add(FetchProducts());
      },
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomVerticalSpacer(height: 32),
          HomeTitleWidget(),
          CustomVerticalSpacer(),
          HomeSearchWidget(),
          CustomVerticalSpacer(),
          HomePopularServicesWidget(),
          CustomVerticalSpacer(),
          HomeBannerWidget(assetImage: "assets/images/astro.jpg"),
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
    );
  }
}
