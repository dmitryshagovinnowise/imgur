import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final AppRouter _appRouter;
  final GetAllFavouritesUseCase _getAllFavouritesUseCase;

  FavouritesCubit(
    this._appRouter,
    this._getAllFavouritesUseCase,
  ) : super(FavouritesLoadingState()) {
    _init();
  }

  Future<void> _init() async {
    final List<PostModel> favorites = await _getAllFavouritesUseCase.execute();

    emit(
      favorites.isEmpty
          ? FavouritesEmptyState()
          : FavouritesLoadedState(favourites: favorites),
    );
  }

  void goToImages() {
    final AutoRoute mainRoute = _appRouter.routes[0];
    final AutoRoute imagesRoute = mainRoute.children!.routes.first;
    _appRouter.navigateNamed(imagesRoute.path);
  }
}
