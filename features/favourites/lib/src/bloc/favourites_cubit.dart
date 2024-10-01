import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final AppRouter _appRouter;
  FavouritesCubit(this._appRouter,) : super(FavouritesLoadingState()){
    _init();
  }


  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(FavouritesEmptyState());
  }

  void goToImages(){
    final AutoRoute mainRoute = _appRouter.routes[0];
    final AutoRoute imagesRoute = mainRoute.children!.routes.first;
    _appRouter.navigateNamed(imagesRoute.path);
  }

}