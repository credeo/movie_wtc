import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_wtc/injection_container.dart';
import 'package:movie_wtc/pages/splash_page.dart';
import 'package:movie_wtc/providers/app_provider.dart';
import 'package:movie_wtc/services/router_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initKiwi();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp((const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          if (!appProvider.isLoaded) {
            // show splash screen here if needed
            return SplashPage(
              onAnimationEnd: appProvider.splashFinished,
            );
          }
          final router = KiwiContainer().resolve<RouterService>().router;

          return EasyLocalization(
            supportedLocales: const [Locale('en')],
            fallbackLocale: const Locale('en'),
            useOnlyLangCode: true,
            path: 'assets/localization',
            child: Builder(builder: (context) {
              return MaterialApp.router(
                title: 'Movie Wtc',
                routerDelegate: router.routerDelegate,
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
              );
            }),
          );
        },
      ),
    );
  }
}
