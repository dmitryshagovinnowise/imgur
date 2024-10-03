import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
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

  Future<void> _init() async {
    try {
      final GalleryModel gallery = await _loadPostsUseCase.execute(
        const GetPostsPayload(),
      );

      emit(
        ImagesLoadedState(gallery: gallery),
      );
    } catch (_) {
      emit(ImagesLoadingErrorState());
    }
  }

  void tryAgain() {
    emit(ImagesLoadingState());
    _init();
  }
}
