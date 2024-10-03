import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/favourites_cubit.dart';

class FavouritesLoaded extends StatelessWidget {
  final List<PostModel> favourites;

  const FavouritesLoaded({
    required this.favourites,
  });

  @override
  Widget build(BuildContext context) {
    return Grid(
      itemCount: favourites.length,
      builder: (_, int index) {
        final PostModel post = favourites[index];
        final ImageModel firstImage = post.images.first;
        return GestureDetector(
          onTap: () =>
              context.read<FavouritesCubit>().goToImageDetails(post.id),
          child: CachedNetworkImage(
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            fit: BoxFit.fitWidth,
            imageUrl: firstImage.link,
            placeholder: (_, __) => Shimmer(),
          ),
        );
      },
    );
  }
}
