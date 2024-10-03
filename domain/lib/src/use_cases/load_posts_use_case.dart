import '../../domain.dart';
import 'use_case.dart';

class LoadPostsUseCase implements FutureUseCase<GetPostsPayload, GalleryModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;

  const LoadPostsUseCase(this._remoteGalleryRepository);

  @override
  Future<GalleryModel> execute(GetPostsPayload input) async {
    final GalleryModel result =
        await _remoteGalleryRepository.getPosts(payload: input);
    final List<PostModel> posts =
        result.posts.where((PostModel post) => post.images.isNotEmpty).toList();
    return GalleryModel(posts: posts);
  }
}
