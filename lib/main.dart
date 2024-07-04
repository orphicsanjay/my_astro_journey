import 'package:astrology/pages/auth/login.page.dart';
import 'package:astrology/pages/auth/otp_verified_page.dart';
import 'package:astrology/pages/user/complete_profile_page.dart';
import 'package:astrology/providers/auth_provider.dart';
import 'package:astrology/providers/country_provider.dart';
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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CountryProvider()),
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
        debugShowCheckedModeBanner: false,
        title: 'Astrology',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Helvetica',
        ),
        home: const CompleteProfilePage(),
        // home: const LoginPage(),
        // home: const OTPVerifiedPage(
        //   isPhoneNumber: true,
        // ),
      ),
    );
  }
}
