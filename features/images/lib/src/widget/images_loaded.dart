import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

class ImagesLoaded extends StatelessWidget {
  final GalleryModel gallery;

  const ImagesLoaded({
    required this.gallery,
  });

  @override
  Widget build(BuildContext context) {
    return Grid(
      itemCount: gallery.posts.length,
      builder: (_, int index) {
        final PostModel post = gallery.posts[index];

        if (post.images.isEmpty) {
          return const Placeholder();
        } else {
          final ImageModel firstImage = post.images.first;

          return Image.network(
            firstImage.link,
            loadingBuilder:
                (_, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;

              return Shimmer();
            },
            errorBuilder: (_, __, ___) => const Placeholder(),
          );
        }
      },
    );
  }
}
