import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ImageDetailsLoaded extends StatelessWidget {
  final PostModel post;

  const ImageDetailsLoaded({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            for (final ImageModel image in post.images) ...[
              CachedNetworkImage(
                imageUrl: image.link,
                placeholder: (_, __) => Shimmer(),
              ),
              const SizedBox(height: 10),
              if (image.description != null) Text(image.description ?? ''),
            ],
          ],
        ),
      ),
    );
  }
}
