import 'package:astrology/pages/auth/login.page.dart';
import 'package:astrology/pages/auth/otp_page.dart';
import 'package:astrology/providers/network_provider.dart';
import 'package:astrology/providers/preferences_provider.dart';
import 'package:astrology/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetworkProvider()),
        ChangeNotifierProvider(create: (_) => PreferencesProvider()),
        ChangeNotifierProvider<UserProvider>(
          create: (context) {
            final preferencesProvider =
                Provider.of<PreferencesProvider>(context);
            return UserProvider(preferencesProvider);
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Astrology',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Helvetica',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 32.0,
                fontWeight: FontWeight.bold),
            displayMedium: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
            displaySmall: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Helvetica', fontSize: 16.0),
            bodyMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 14.0),
            bodySmall: TextStyle(fontFamily: 'Helvetica', fontSize: 12.0),
            labelLarge: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 12.0),
            labelSmall: TextStyle(fontFamily: 'Helvetica', fontSize: 10.0),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
