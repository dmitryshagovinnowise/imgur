import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'image_details_state.dart';

class ImageDetailsCubit extends Cubit<ImageDetailsState> {
  final GetDetailsUseCase _getDetailsUseCase;

  ImageDetailsCubit(
    this._getDetailsUseCase,
    String postId,
  ) : super(ImageDetailsLoadingState()) {
    _init(postId);
  }

  Future<void> _init(String postId) async {
    final PostModel post = await _getDetailsUseCase.execute(
      GetDetailsPayload(id: postId),
    );

    emit(
      ImageDetailsLoadedState(post: post),
    );
  }
}
