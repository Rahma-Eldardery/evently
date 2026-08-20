import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/my_provider.dart';
import 'package:evently/core/my_theme_data.dart';
import 'package:evently/features/add_event/add_event_screen.dart';
import 'package:evently/features/edit_event/edit_event.dart';
import 'package:evently/features/event_datails/event_details_screen.dart';
import 'package:evently/features/forget_password/forget_password_screen.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/login/login.dart';
import 'package:evently/features/onboarding/onboarding_screen.dart';
import 'package:evently/features/register/register_screen.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const fatalError = true;
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => MyProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<MyProvider>(context);
    FirebaseCrashlytics.instance.recordError(
      Exception(),
      StackTrace.fromString("stackTraceString"),
    );
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      routes: {
        OnboardingScreen.routeName: (c) => OnboardingScreen(),
        LoginScreen.routeName: (c) => LoginScreen(),
        RegisterScreen.routeName: (c) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (c) => ForgetPasswordScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        AddEventScreen.routeName: (c) => AddEventScreen(),
        EventDetailsScreen.routeName: (c) => EventDetailsScreen(),
        EditEventScreen.routeName: (c) => EditEventScreen(),
      },
      initialRoute: userProvider.firebaseUser != null
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
