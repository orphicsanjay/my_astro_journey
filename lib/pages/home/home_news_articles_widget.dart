import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class HomeNewsArticlesWidget extends StatelessWidget {
  const HomeNewsArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: "News / Articles", onTap: () {}),
        const CustomVerticalSpacer(),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsArticleWidget(),
              CustomHorizontalSpacer(),
              NewsArticleWidget(),
              CustomHorizontalSpacer(),
              NewsArticleWidget(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class NewsArticleWidget extends StatelessWidget {
  const NewsArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Card(
        elevation: 2,
        color: ColorUtil.colorWhite,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/pooja_thali.jpeg",
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "How to book a Pooja thaali in Astro Journey",
                style: StyleUtil.style14DarkBlue,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const CustomVerticalSpacer(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "5th Jan, 2023",
                  style: StyleUtil.style14Orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
