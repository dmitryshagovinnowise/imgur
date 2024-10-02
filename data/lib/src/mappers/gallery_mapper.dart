import 'package:domain/domain.dart';

import '../entities/entities.dart';
import 'post_mapper.dart';

abstract class GalleryMapper {
  static GalleryModel fromEntity(GalleryEntity entity) {
    return GalleryModel(
      posts: entity.posts
          .map(PostMapper.fromEntity)
          .where((PostModel post) => post.images.isNotEmpty)
          .toList(),
    );
  }
}
