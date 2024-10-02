import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final LoadPostsUseCase _loadPostsUseCase;

  ImagesCubit(this._loadPostsUseCase) : super(ImagesLoadingState()) {
    _init();
  }

  Future<void> _init() async {
    final GalleryModel gallery = await _loadPostsUseCase.execute(
      const GetPostsPayload(),
    );

    emit(
      ImagesLoadedState(gallery: gallery),
    );
  }
}
