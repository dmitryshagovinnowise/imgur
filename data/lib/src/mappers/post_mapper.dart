import 'package:domain/domain.dart';

import '../entities/entities.dart';
import 'image_mapper.dart';

abstract class PostMapper {
  static PostModel fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      datetime: entity.datetime,
      images: entity.images
              ?.where((ImageEntity image) => image.type.contains('image'))
              .map(ImageMapper.fromEntity)
              .toList() ??
          <ImageModel>[],
    );
  }

  static PostEntity toEntity(PostModel model) {
    return PostEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      datetime: model.datetime,
      images: model.images.map(ImageMapper.toEntity).toList(),
    );
  }
}
