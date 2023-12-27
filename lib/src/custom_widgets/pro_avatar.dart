import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProAvatar extends StatelessWidget {
  const ProAvatar({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 70,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>
              const Icon(Icons.person, size: 32),
        ));
  }
}
