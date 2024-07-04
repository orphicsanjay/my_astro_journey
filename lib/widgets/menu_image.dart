import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  final String url;
  const MenuImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
