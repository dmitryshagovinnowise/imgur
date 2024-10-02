import 'package:domain/domain.dart';

import '../entities/entities.dart';
import 'image_mapper.dart';

abstract class PostMapper {
  static PostModel fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      images: entity.images
          ?.where((ImageEntity image) => image.type.contains('image'))
          .map(ImageMapper.fromEntity)
          .toList() ?? <ImageModel>[],
    );
  }
}
