import 'package:astrology/pages/banners/my_pager.dart';
import 'package:astrology/pages/news/new_slider.dart';
import 'package:astrology/pages/news/news_banner_image.dart';
import 'package:astrology/pages/news/news_widgets.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/strings.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class NewsEventDetailPage extends StatefulWidget {
  const NewsEventDetailPage({super.key});

  @override
  State<NewsEventDetailPage> createState() => _NewsEventDetailPageState();
}

class _NewsEventDetailPageState extends State<NewsEventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "News & Events Title"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: const NewsBannerImage(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How to book a pujari on Astro Journey",
                    style: StyleUtil.style16DarkBlue,
                  ),
                  const Text(
                    "5th Jan, 2024",
                    style: StyleUtil.style12Orange,
                  ),
                  const Text(
                    newsEventsDescription,
                    style: StyleUtil.style14Black,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Column(
                      children: [
                        // NewsWidget(),
                        // NewsWidget(),
                        // NewsWidget(),
                        // NewsWidget(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
