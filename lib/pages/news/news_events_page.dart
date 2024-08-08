import 'package:astrology/pages/news/new_slider.dart';
import 'package:astrology/pages/news/news_widgets.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:flutter/material.dart';

class NewsEventPage extends StatefulWidget {
  const NewsEventPage({super.key});

  @override
  State<NewsEventPage> createState() => _NewsEventPageState();
}

class _NewsEventPageState extends State<NewsEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "News & Events"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NewsSlider(),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  NewsWidget(),
                  NewsWidget(),
                  NewsWidget(),
                  NewsWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
