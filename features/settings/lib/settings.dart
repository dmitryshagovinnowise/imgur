import 'package:navigation/navigation.dart';

import 'settings.gm.dart';

export 'settings.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page|Form,Route')
class SettingsModule extends $SettingsModule {}