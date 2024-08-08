import 'package:astrology/bloc/shop/shop_bloc.dart';
import 'package:astrology/bloc/shop/shop_event.dart';
import 'package:astrology/bloc/shop/shop_state.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/models/product/products.dart';
import 'package:astrology/providers/products_provider.dart';
import 'package:astrology/shimmer/product_shimmer.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/snackbar_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/custom_empty_widget.dart';
import 'package:astrology/widgets/custom_error_widget.dart';
import 'package:astrology/widgets/default_image.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:astrology/widgets/title_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeAstroShopWidget extends StatefulWidget {
  const HomeAstroShopWidget({super.key});

  @override
  State<HomeAstroShopWidget> createState() => _HomeAstroShopWidgetState();
}

class _HomeAstroShopWidgetState extends State<HomeAstroShopWidget> {
  @override
  void initState() {
    getIt<ShopBloc>().add(FetchProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: "Astro Shop", onTap: () {}),
        const CustomVerticalSpacer(),
        BlocConsumer<ShopBloc, ShopState>(
          bloc: getIt<ShopBloc>(),
          builder: (context, ShopState state) {
            if (state.isLoading) {
              return const ProductsShimmer();
            } else if (state.products != null) {
              final List<Products> productsList = state.products ?? [];
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.26,
                child: ListView.builder(
                  itemCount: productsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AstroShopCard(product: productsList[index]);
                  },
                ),
              );
            } else {
              return CustomErrorWidget(errorMessage: state.error!);
            }
          },
          listener: (context, ShopState state) {
            if (state.error != null) {
              SnackbarUtils.showSnackbar(context, "Something went wrong!");
            }
          },
        ),
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
              ),
            ),
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
