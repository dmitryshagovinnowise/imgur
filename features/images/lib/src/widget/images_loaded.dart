import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

class ImagesLoaded extends StatelessWidget {
  final GalleryModel gallery;
  final ValueChanged<String> onOpenImage;

  const ImagesLoaded({
    required this.gallery,
    required this.onOpenImage,
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

          return GestureDetector(
            onTap: () => onOpenImage.call(post.id),
            child: CachedNetworkImage(
              imageUrl: firstImage.link,
              placeholder: (_, __) => Shimmer(),
              errorWidget: (_, __, ___) => const Placeholder(),
            ),
          );
        }
      },
    );
  }
}
