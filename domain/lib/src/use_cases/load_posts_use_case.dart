import '../models/gallery_model.dart';
import '../payloads/payloads.dart';
import '../repositories/repositories.dart';
import 'use_case.dart';

class LoadPostsUseCase implements FutureUseCase<GetPostsPayload, GalleryModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;

  const LoadPostsUseCase(this._remoteGalleryRepository);

  @override
  Future<GalleryModel> execute(GetPostsPayload input) {
    return _remoteGalleryRepository.getPosts(payload: input);
  }
}
