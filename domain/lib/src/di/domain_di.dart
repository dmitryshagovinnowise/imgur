import 'package:core/core.dart';

import '../../domain.dart';

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerFactory<AddToFavouritesUseCase>(
      () => AddToFavouritesUseCase(locator.get()),
    );

    locator.registerFactory<CheckFavouritesUseCase>(
      () => CheckFavouritesUseCase(locator.get()),
    );

    locator.registerFactory<GetDetailsUseCase>(
      () => GetDetailsUseCase(
        locator.get(),
        locator.get(),
      ),
    );

    locator.registerFactory<ListenFavouritesUseCase>(
      () => ListenFavouritesUseCase(
        locator.get(),
      ),
    );

    locator.registerFactory<GetAllFavouritesUseCase>(
      () => GetAllFavouritesUseCase(locator.get()),
    );

    locator.registerFactory<LoadPostsUseCase>(
      () => LoadPostsUseCase(
        locator.get(),
        locator.get(),
      ),
    );

    locator.registerFactory<RemoveFromFavouritesUseCase>(
      () => RemoveFromFavouritesUseCase(locator.get()),
    );
  }
}
