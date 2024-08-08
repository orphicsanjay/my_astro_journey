import 'package:astrology/pages/astro_shop/astro_product_categories.dart';
import 'package:astrology/pages/astro_shop/product_banner_widget.dart';
import 'package:astrology/pages/astro_shop/shop_special_offers.dart';
import 'package:astrology/pages/astrologer/astrologer_search_widget.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class AstroShopPage extends StatefulWidget {
  const AstroShopPage({super.key});

  @override
  State<AstroShopPage> createState() => _AstroShopPageState();
}

class _AstroShopPageState extends State<AstroShopPage> {
  void handleSearchChanged(String value) {}
  void handleAstrologerSearch() {}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        title: "Astro Shop",
        actions: [
          Card(
            shape: const CircleBorder(),
            margin: const EdgeInsets.only(right: 8.0),
            elevation: 5,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16, // Adjust the radius as needed
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: ColorUtil.colorOrange,
                  size: 16, // Adjust the size as needed
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
              AstrologerSearchWidget(
                hintText: "Search astro products",
                onChanged: handleSearchChanged,
                onTap: handleAstrologerSearch,
              ),
              const ProductBannerWudget(),
              const CustomVerticalSpacer(height: 8),
              const AstroProductCategories(),
              const CustomVerticalSpacer(height: 8),
              const ShopSpecialOffers(),
              const CustomVerticalSpacer(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
