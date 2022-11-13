import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/feature/splash/presentation/splash_Screen.dart';

import '../app/app_rountes.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.splashScreen,
  }) : super(key: key);

  final SplashScreen splashScreen;

  @override
  Widget build(BuildContext context) {
    // Glue the splashScreen to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the splashScreen for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      // theme: AppTheme.applicationDefaultTheme(context),
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      onUnknownRoute: AppRoutes.onUnknownRoute,
      initialRoute: SplashScreen.routeName,
      title: 'To DO List',
      // theme: ThemeData.light(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('es', 'US'),
        Locale('es', 'IN'),
      ],

      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: const [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        // FormBuilderLocalizations.delegate
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return null;
      },
    );
  }
}
