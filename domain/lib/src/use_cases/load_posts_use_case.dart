import '../../domain.dart';
import 'use_case.dart';

class LoadPostsUseCase implements FutureUseCase<GetPostsPayload, GalleryModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;
  final LocalFavouritesRepository _localFavouritesRepository;

  const LoadPostsUseCase(
    this._remoteGalleryRepository,
    this._localFavouritesRepository,
  );

  @override
  Future<GalleryModel> execute(GetPostsPayload input) async {
    final GalleryModel result =
        await _remoteGalleryRepository.getPosts(payload: input);

    final List<PostModel> favourites =
        await _localFavouritesRepository.getFavourites();
    final List<String> favouritesId =
        favourites.map((PostModel post) => post.id).toList();

    final List<PostModel> posts = result.posts
        .where((PostModel post) => post.images.isNotEmpty)
        .map(
          (PostModel post) => favouritesId.contains(post.id)
              ? post.copyWith(isFavourite: true)
              : post,
        )
        .toList();

    posts.sort(
      (PostModel a, PostModel b) => a.datetime.compareTo(b.datetime),
    );

    return GalleryModel(posts: posts);
  }
}
