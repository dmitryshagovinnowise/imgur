import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../entities/gallery_entity.dart';
import '../mappers/mappers.dart';
import '../providers/providers.dart';

class RemoteGalleryRepositoryImpl implements RemoteGalleryRepository {
  final ImgurProvider _imgurProvider;

  const RemoteGalleryRepositoryImpl(this._imgurProvider);

  @override
  Future<GalleryModel> getPosts({required GetPostsPayload payload}) async {
    final GalleryEntity result = await _imgurProvider.gallery(
      'Client-ID $clientId',
      payload.sectionEnum.name,
      payload.sortEnum.name,
      payload.windowEnum.name,
      payload.page,
    );

    return GalleryMapper.fromEntity(result);
  }
}
