import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
  }

  static void _initApi(GetIt locator) {
    locator.registerLazySingleton<DatabaseConfig>(
      DatabaseConfig.new,
    );

    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );

    locator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: locator<AppEventNotifier>(),
      ),
    );
  }

  static void _initProviders(GetIt locator) {
    locator.registerFactory<FavouriteProvider>(
      () => FavouriteProvider(locator<DatabaseConfig>()),
    );

    locator.registerFactory<ImgurProvider>(
      () => ImgurProvider(locator<DioConfig>().dio),
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerFactory<LocalFavouritesRepository>(
      () => LocalFavouritesRepositoryImpl(locator<FavouriteProvider>()),
    );

    locator.registerFactory<RemoteGalleryRepository>(
      () => RemoteGalleryRepositoryImpl(locator<ImgurProvider>()),
    );
  }
}
