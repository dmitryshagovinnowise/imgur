import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/images_cubit.dart';

class ImagesLoaded extends StatelessWidget {
  final GalleryModel gallery;

  const ImagesLoaded({
    required this.gallery,
  });

  @override
  Widget build(BuildContext context) {
    return Grid(
      controller: context.read<ImagesCubit>().paginationController,
      itemCount: gallery.posts.length,
      builder: (_, int index) {
        final PostModel post = gallery.posts[index];
        final ImageModel firstImage = post.images.first;
        return Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.read<ImagesCubit>().goToImageDetails(post.id);
              },
              child: CachedNetworkImage(
                fadeInDuration: Duration.zero,
                fadeOutDuration: Duration.zero,
                fit: BoxFit.fitWidth,
                imageUrl: firstImage.link,
                placeholder: (_, __) => Shimmer(),
              ),
            ),
            if (post.isFavourite)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(AppDimens.PADDING_10),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
