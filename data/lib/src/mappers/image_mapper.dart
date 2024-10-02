import 'package:domain/domain.dart';

import '../entities/entities.dart';

abstract class ImageMapper {
  static ImageModel fromEntity(ImageEntity entity) {
    return ImageModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      datetime: entity.datetime,
      link: entity.link,
    );
  }
}
