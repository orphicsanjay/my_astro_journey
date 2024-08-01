import 'package:astrology/models/product/products.dart';
import 'package:astrology/providers/products_provider.dart';
import 'package:astrology/shimmer/product_shimmer.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/custom_empty_widget.dart';
import 'package:astrology/widgets/custom_error_widget.dart';
import 'package:astrology/widgets/default_image.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAstroShopWidget extends StatefulWidget {
  const HomeAstroShopWidget({super.key});

  @override
  State<HomeAstroShopWidget> createState() => _HomeAstroShopWidgetState();
}

class _HomeAstroShopWidgetState extends State<HomeAstroShopWidget> {
  @override
  void initState() {
    Provider.of<ProductsProvider>(context, listen: false)
        .fetchProductsList(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Astro Shop", style: StyleUtil.style16DarkBlueBold),
            ),
            Text(
              "View All",
              style: StyleUtil.style14DarkBlue,
            ),
          ],
        ),
        const CustomVerticalSpacer(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<void>(
            future: Provider.of<ProductsProvider>(context, listen: false)
                .fetchProductsList(null),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProductsShimmer();
              } else if (snapshot.hasError) {
                return const CustomErrorWidget(
                    errorMessage: "Error fetching products");
              } else {
                return Consumer<ProductsProvider>(
                  builder: (context, productsProvider, child) {
                    final productsList = productsProvider.productsList;
                    if (productsList == null || productsList.isEmpty) {
                      return const CustomEmptyWidget(
                          message: "No products available");
                    } else {
                      return Row(
                        children: productsList.map((product) {
                          return AstroShopCard(product: product);
                        }).toList(),
                      );
                    }
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class AstroShopCard extends StatelessWidget {
  final Products product;
  const AstroShopCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: product.productColor![0].images![0],
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SmallCircularProgess(),
                  errorWidget: (context, url, error) => const DefaultImage(),
                )),
            const SizedBox(height: 8),
            Text(
              "${product.name}",
              style: StyleUtil.style14DarkBlue,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Buy",
                style: StyleUtil.style14White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
