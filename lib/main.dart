import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/app/modules/notes_taking/model/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:fyp/app/firebase_options.dart';
import 'package:fyp/app/modules/authentication/screens/authentication_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_machine/time_machine.dart';
import 'package:fyp/app/controller/isar_contoller.dart';
import 'package:fyp/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:isar/isar.dart';
import 'package:fyp/theme/theme_controller.dart';
import 'app/data/schema.dart';
import 'translation/translation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late Isar isar;
late Settings settings;

bool amoledTheme = false;
bool materialColor = false;
bool isImage = true;
String timeformat = '24';
Locale locale = const Locale('en', 'US');

final List appLanguages = [
  {'name': 'English', 'locale': const Locale('en', 'US')}
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ImageModelAdapter());
  await Hive.openBox<ImageModel>('images');

  await Hive.initFlutter();
  await Hive.openBox("Habit_Database");

  final String timeZoneName;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
  if (Platform.isAndroid) {
    await setOptimalDisplayMode();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    timeZoneName = await FlutterTimezone.getLocalTimezone();
  } else {
    timeZoneName = '${DateTimeZone.local}';
  }
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
  const DarwinInitializationSettings initializationSettingsIos =
      DarwinInitializationSettings();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'ToDark');
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      linux: initializationSettingsLinux,
      iOS: initializationSettingsIos);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await IsarController().openDB();
  await initSettings();
  runApp(const MyApp());
}

Future<void> setOptimalDisplayMode() async {
  final List<DisplayMode> supported = await FlutterDisplayMode.supported;
  final DisplayMode active = await FlutterDisplayMode.active;
  final List<DisplayMode> sameResolution = supported
      .where((DisplayMode m) =>
          m.width == active.width && m.height == active.height)
      .toList()
    ..sort((DisplayMode a, DisplayMode b) =>
        b.refreshRate.compareTo(a.refreshRate));
  final DisplayMode mostOptimalMode =
      sameResolution.isNotEmpty ? sameResolution.first : active;
  await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
}

Future<void> initSettings() async {
  settings = isar.settings.where().findFirstSync() ?? Settings();
  if (settings.language == null) {
    settings.language = '${Get.deviceLocale}';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }

  if (settings.theme == null) {
    settings.theme = 'system';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }

  if (settings.isImage == null) {
    settings.isImage = true;
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<void> updateAppState(
    BuildContext context, {
    bool? newAmoledTheme,
    bool? newMaterialColor,
    bool? newIsImage,
    String? newTimeformat,
    Locale? newLocale,
  }) async {
    final state = context.findAncestorStateOfType<_MyAppState>()!;

    if (newAmoledTheme != null) {
      state.changeAmoledTheme(newAmoledTheme);
    }
    if (newMaterialColor != null) {
      state.changeMarerialTheme(newMaterialColor);
    }
    if (newTimeformat != null) {
      state.changeTimeFormat(newTimeformat);
    }
    if (newLocale != null) {
      state.changeLocale(newLocale);
    }
    if (newIsImage != null) {
      state.changeIsImage(newIsImage);
    }
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = Get.put(ThemeController());

  void changeAmoledTheme(bool newAmoledTheme) {
    setState(() {
      amoledTheme = newAmoledTheme;
    });
  }

  void changeMarerialTheme(bool newMaterialColor) {
    setState(() {
      materialColor = newMaterialColor;
    });
  }

  void changeIsImage(bool newIsImage) {
    setState(() {
      isImage = newIsImage;
    });
  }

  void changeTimeFormat(String newTimeformat) {
    setState(() {
      timeformat = newTimeformat;
    });
  }

  void changeLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  @override
  void initState() {
    amoledTheme = settings.amoledTheme;
    materialColor = settings.materialColor;
    timeformat = settings.timeformat;
    isImage = settings.isImage!;
    locale = Locale(
        settings.language!.substring(0, 2), settings.language!.substring(3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final lightMaterialTheme =
              lightTheme(lightColorScheme?.surface, lightColorScheme);
          final darkMaterialTheme =
              darkTheme(darkColorScheme?.surface, darkColorScheme);
          final darkMaterialThemeOled = darkTheme(oledColor, darkColorScheme);

          return GetMaterialApp(
            theme: materialColor
                ? lightColorScheme != null
                    ? lightMaterialTheme
                    : lightTheme(lightColor, colorSchemeLight)
                : lightTheme(lightColor, colorSchemeLight),
            darkTheme: amoledTheme
                ? materialColor
                    ? darkColorScheme != null
                        ? darkMaterialThemeOled
                        : darkTheme(oledColor, colorSchemeDark)
                    : darkTheme(oledColor, colorSchemeDark)
                : materialColor
                    ? darkColorScheme != null
                        ? darkMaterialTheme
                        : darkTheme(darkColor, colorSchemeDark)
                    : darkTheme(darkColor, colorSchemeDark),
            themeMode: themeController.theme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            translations: Translation(),
            locale: locale,
            fallbackLocale: const Locale('en', 'US'),
            supportedLocales:
                appLanguages.map((e) => e['locale'] as Locale).toList(),
            debugShowCheckedModeBanner: false,
            // home: settings.onboard ? const HomePage() : const OnBording(),
            home: const AuthenticationScreen(),
            // builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
