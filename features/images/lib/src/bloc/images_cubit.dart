import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> with PaginationMixin<ImagesState> {
  final AppRouter _appRouter;
  final LoadPostsUseCase _loadPostsUseCase;
  final CheckFavouritesUseCase _checkFavouritesUseCase;

  ImagesCubit(
    this._appRouter,
    this._loadPostsUseCase,
    this._checkFavouritesUseCase,
  ) : super(ImagesLoadingState()) {
    _init();
  }

  Future<void> goToImageDetails(String id) async {
    await _appRouter.push<bool>(
      ImageDetailsRoute(id: id),
    );

    await _updateFavouriteStatus(id: id);
  }

  void tryAgain() {
    emit(ImagesLoadingState());
    _init();
  }

  Future<void> _init() async {
    initPagination(onLoad: _loadPage);
    await _loadPage(0);
  }

  Future<void> _loadPage(int page) async {
    try {
      final GalleryModel pageGallery = await _loadPostsUseCase.execute(
        GetPostsPayload(page: page),
      );

      final ImagesState state = this.state;
      final GalleryModel gallery = state is ImagesLoadedState
          ? pageGallery.combine(state.gallery)
          : pageGallery;

      emit(
        ImagesLoadedState(gallery: gallery),
      );
    } catch (_) {
      emit(ImagesLoadingErrorState());
    }
  }

  Future<void> _updateFavouriteStatus({
    required String id,
  }) async {
    final ImagesState state = this.state;
    if (state is! ImagesLoadedState) return;

    final bool isFavourite = await _checkFavouritesUseCase.execute(id);

    final int index = state.gallery.posts.indexWhere(
      (PostModel post) => post.id == id,
    );
    if (state.gallery.posts[index].isFavourite == isFavourite) return;

    final List<PostModel> posts = List<PostModel>.of(state.gallery.posts);
    posts[index] = posts[index].copyWith(isFavourite: isFavourite);

    emit(
      ImagesLoadedState(
        gallery: GalleryModel(posts: posts),
      ),
    );
  }

  @override
  Future<void> close() {
    disposePagination();

    return super.close();
  }
}
