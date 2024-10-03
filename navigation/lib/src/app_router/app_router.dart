import 'package:auto_route/auto_route.dart';
import 'package:favourites/favourites.dart';
import 'package:image_details/image_details.dart';
import 'package:images/images.dart';
import 'package:main/main.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Form|Screen|Step,Route',
  modules: <Type>[
    FavouritesModule,
    MainModule,
    ImagesModule,
    SettingsModule,
    ImageDetailsModule,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          children: <AutoRoute>[
            AutoRoute(
              initial: true,
              page: ImagesRoute.page,
            ),
            AutoRoute(
              page: FavouritesRoute.page,
            ),
            AutoRoute(
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: ImageDetailsRoute.page,
        ),
      ];
}
