import 'package:favourites/favourites.dart';
import 'package:flutter/material.dart';
import 'package:images/images.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        ImagesRoute(),
        FavouritesRoute(),
        SettingsRoute()
      ],
      builder: (BuildContext tabContext, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(tabContext);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Posts',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
