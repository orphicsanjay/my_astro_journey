import 'package:astrology/pages/astrologer/astrologer_list_card.dart';
import 'package:astrology/pages/astrologer/astrologer_search_widget.dart';
import 'package:astrology/pages/banners/my_pager.dart';
import 'package:astrology/providers/astrologer_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AstrologerListPage extends StatefulWidget {
  const AstrologerListPage({super.key});

  @override
  State<AstrologerListPage> createState() => _AstrologerListPageState();
}

class _AstrologerListPageState extends State<AstrologerListPage> {
  bool showHideSearch = false;

  void updateShowHideSearch(bool value) {
    showHideSearch = value;
    setState(() {});
  }

  void handleSearchChanged(String value) {}
  void handleAstrologerSearch() {}

  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final astrologerProvider = Provider.of<AstrologerProvider>(context);
    return Scaffold(
      appBar: CustomAppbar(
        title: "Astrologers",
        actions: [
          Card(
            shape: const CircleBorder(),
            elevation: 5,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30, // Adjust the radius as needed
              child: InkWell(
                onTap: () {
                  updateShowHideSearch(true);
                },
                child: const Icon(
                  Icons.search,
                  color: ColorUtil.colorOrange,
                  size: 30, // Adjust the size as needed
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 16.0, vertical: 16.0),
              //   child: AstrologerOptionsWidget(
              //     astrologerList: astrologerProvider.astrologerList,
              //     onTap: (value) {},
              //   ),
              // ),
              // Container(
              //   height: 1,
              //   width: size.width,
              //   color: ColorUtil.colorGrey,
              // ),
              showHideSearch
                  ? AstrologerSearchWidget(
                      onChanged: handleSearchChanged,
                      onTap: handleAstrologerSearch,
                    )
                  : const SizedBox(),
              // MyPager(),
              const MyPager(),
              const CustomVerticalSpacer(),
              const AstrologerListCard(),
              const AstrologerListCard(),
              const AstrologerListCard(),
              const AstrologerListCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.orange : Colors.grey,
      ),
    );
  }
}
