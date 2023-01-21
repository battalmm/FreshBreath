import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'core/constants/applications/app_constants.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.preferencesInit();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(),
      )
    ],
    child: EasyLocalization(
        startLocale: LanguageManager.instance.trLocale,
        fallbackLocale: LanguageManager.instance.trLocale,
        saveLocale: true,
        supportedLocales: LanguageManager.instance.locals,
        path: AppConstants.LANGUAGE_PATH,
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //UPDATE NAVİGATOR WİTH REAL
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: NavigationRoutes.home.name,
      onGenerateRoute: NavigationRoutesPathGeneration.onGenerateRoute,
      // ADD THEME OPTIONS
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      // ADD WORDS TO LOCALİZATİON
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Fresh Breath',
    );
  }
}
