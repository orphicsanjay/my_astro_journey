import 'package:astrology/pages/news/news_banner_image.dart';
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to book a pujari on Astro Journey",
                    style: StyleUtil.style16DarkBlue,
                  ),
                  Text(
                    "5th Jan, 2024",
                    style: StyleUtil.style12Orange,
                  ),
                  Text(
                    newsEventsDescription,
                    style: StyleUtil.style14Black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
