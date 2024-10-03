import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> with PaginationMixin<ImagesState> {
  final AppRouter _appRouter;
  final LoadPostsUseCase _loadPostsUseCase;

  ImagesCubit(
    this._appRouter,
    this._loadPostsUseCase,
  ) : super(ImagesLoadingState()) {
    _init();
  }

  void goToImageDetails(String id) {
    _appRouter.push(ImageDetailsRoute(id: id));
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

  @override
  Future<void> close() {
    disposePagination();

    return super.close();
  }
}
