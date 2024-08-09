import 'package:astrology/bloc/astrologer/astrologer_bloc.dart';
import 'package:astrology/bloc/astrologer/astrologer_event.dart';
import 'package:astrology/bloc/astrologer/astrologer_state.dart';
import 'package:astrology/dependency_injection.dart';
import 'package:astrology/models/astrologer/astrologer.dart';
import 'package:astrology/pages/astrologer/astrologer_list_card.dart';
import 'package:astrology/pages/astrologer/astrologer_search_widget.dart';
import 'package:astrology/pages/banners/my_pager.dart';
import 'package:astrology/shimmer/astrologer_shimmer.dart';

import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    getIt<AstrologerBloc>().add(FetchAstrologersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Astrologers",
        actions: [
          Card(
            shape: const CircleBorder(),
            margin: const EdgeInsets.only(right: 8.0),
            elevation: 5,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: InkWell(
                onTap: () {
                  updateShowHideSearch(true);
                },
                child: const Icon(
                  Icons.search,
                  color: ColorUtil.colorOrange,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (showHideSearch)
            SliverToBoxAdapter(
              child: AstrologerSearchWidget(
                hintText: "Search Astrologer",
                onChanged: handleSearchChanged,
                onTap: handleAstrologerSearch,
              ),
            ),
          const SliverToBoxAdapter(child: MyPager()),
          BlocBuilder<AstrologerBloc, AstrologerState>(
            bloc: getIt<AstrologerBloc>(),
            builder: (context, state) {
              if (state.isLoadingAstrologersList) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const BuildAstrologerShimmer();
                    },
                    childCount: 3,
                  ),
                );
              } else if (state.astrologers.isNotEmpty) {
                final List<Astrologer> astrologersList = state.astrologers;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final astrologer = astrologersList[index];
                      return AstrologerListCard(astrologer: astrologer);
                    },
                    childCount: astrologersList.length,
                  ),
                );
              } else {
                return SliverFillRemaining(
                  child: CustomErrorWidget(errorMessage: state.listError ?? ""),
                );
              }
            },
          ),
        ],
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
