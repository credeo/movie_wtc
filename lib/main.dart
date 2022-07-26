import 'package:easy_localization/easy_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/injection_container.dart';
import 'package:movie_wtc/providers/app_provider.dart';
import 'package:movie_wtc/services/router_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  initKiwi();

  EasyLocalization.logger.enableLevels = [LevelMessages.info, LevelMessages.warning, LevelMessages.error];
  await EasyLocalization.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      path: 'assets/localization',
      child: ChangeNotifierProvider<AppProvider>(
        create: (context) => AppProvider(),
        child: Consumer<AppProvider>(
          builder: (context, appProvider, child) {
            final router = KiwiContainer().resolve<RouterService>().router;
            return MaterialApp.router(
              title: 'Movie Wtc',
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
