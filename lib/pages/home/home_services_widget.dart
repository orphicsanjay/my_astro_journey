import 'dart:developer';

import 'package:astrology/locator.dart';
import 'package:astrology/models/services/app_service.dart';
import 'package:astrology/providers/app_service_provider.dart';
import 'package:astrology/shimmer/product_shimmer.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/custom_empty_widget.dart';
import 'package:astrology/widgets/custom_error_widget.dart';
import 'package:astrology/widgets/default_image.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:astrology/widgets/title_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeServicesWidget extends StatefulWidget {
  const HomeServicesWidget({super.key});

  @override
  State<HomeServicesWidget> createState() => _HomeServicesWidgetState();
}

class _HomeServicesWidgetState extends State<HomeServicesWidget> {
  // @override
  // void initState() {
  //   getIt<AppServicesProvider>().fetchAppServiceList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: "Services", onTap: () {}),
        const CustomVerticalSpacer(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<void>(
            future: getIt<AppServicesProvider>().fetchAppServiceList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProductsShimmer();
              } else if (snapshot.hasError) {
                return const CustomErrorWidget(
                    errorMessage: "Error fetching products");
              } else {
                return Consumer<AppServicesProvider>(
                  builder: (context, productsProvider, child) {
                    final appServiceList = productsProvider.appServiceList;
                    if (appServiceList == null || appServiceList.isEmpty) {
                      return const CustomEmptyWidget(
                          message: "No services available");
                    } else {
                      return Row(
                        children: appServiceList.map((appService) {
                          return ServiceCard(appService: appService);
                        }).toList(),
                      );
                    }
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final AppService appService;
  const ServiceCard({super.key, required this.appService});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: appService.image!,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SmallCircularProgess(),
                errorWidget: (context, url, error) => const DefaultImage(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${appService.name}",
              style: StyleUtil.style14DarkBlue,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Connect",
                style: StyleUtil.style14White,
              ),
            ),
            const CustomVerticalSpacer(height: 8),
          ],
        ),
      ),
    );
  }
}
