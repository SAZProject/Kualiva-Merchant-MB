import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/_data/shared_pref_collection.dart';
import 'package:kualiva_merchant_mb/hive/hive_boxes.dart';
import 'package:kualiva_merchant_mb/hive/hive_registrar.g.dart';
import 'package:kualiva_merchant_mb/main_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    await Future.delayed(const Duration(seconds: 1));
    SystemChrome.restoreSystemUIOverlays();
  });

  await Hive.initFlutter();
  Hive.registerAdapters();
  await HiveBoxes.openBox();

  await PrefUtils.init();

  String dotenvFileName = '';

  if (kReleaseMode) {
    dotenvFileName = '.env';
  } else if (kProfileMode) {
    dotenvFileName = '.env.profile';
  } else {
    dotenvFileName = '.env.dev';
  }

  await Future.wait([
    dotenv.load(fileName: dotenvFileName),
    EasyLocalization.ensureInitialized(),
  ]);

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translation',
    startLocale: const Locale("en"),
    fallbackLocale: const Locale("en"),
    useFallbackTranslations: true,
    useOnlyLangCode: true,
    child: MyApp(savedThemeMode: savedThemeMode),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainProvider(
      mainChild: Sizer(
        builder: (context, orientation, deviceType) {
          return AdaptiveTheme(
            light: ThemeHelper().themeData(ColorSchemes.lightModeScheme),
            dark: ThemeHelper().themeData(ColorSchemes.darkModeScheme),
            initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
            debugShowFloatingThemeButton: kDebugMode,
            builder: (light, dark) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Walt Merchant',
              theme: light,
              darkTheme: dark,
              initialRoute: AppRoutes.splashScreen,
              onGenerateRoute: (settings) => generateRoute(settings),
            ),
          );
        },
      ),
    );
  }
}
