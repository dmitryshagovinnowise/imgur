import '../models/models.dart';
import '../repositories/repositories.dart';
import 'use_case.dart';

class GetAllFavouritesUseCase implements FutureUseCase<void, List<PostModel>> {
  final LocalFavouritesRepository _localFavouritesRepository;

  const GetAllFavouritesUseCase(this._localFavouritesRepository);

  @override
  Future<List<PostModel>> execute([void input]) {
    return _localFavouritesRepository.getFavourites();
  }
}
