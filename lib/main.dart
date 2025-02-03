import 'package:aces/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:aces/splash_page.dart';
import 'package:aces/firebase_options.dart';
import 'package:aces/settings_manager.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsManager(),
      child: Consumer<SettingsManager>(
        builder: (context, settings, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Remove the debug banner
            title: 'Flutter Demo',
            theme: settings.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
            locale: settings.currentLocale,
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('es', ''), // Spanish
              Locale('hi', ''), // Hindi
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
