import '../models/models.dart';
import '../payloads/payloads.dart';
import '../repositories/repositories.dart';
import 'use_case.dart';

class GetDetailsUseCase implements FutureUseCase<GetDetailsPayload, PostModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;

  const GetDetailsUseCase(this._remoteGalleryRepository);

  @override
  Future<PostModel> execute(GetDetailsPayload input) {
    return _remoteGalleryRepository.getDetails(payload: input);
  }
}
