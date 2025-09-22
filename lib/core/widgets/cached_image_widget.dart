import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            Center(child: Image.asset(Assets.imagesLoading, fit: BoxFit.fill)),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
