import 'package:astrology/providers/app_service_provider.dart';
import 'package:astrology/providers/astrologer_provider.dart';
import 'package:astrology/providers/auth_provider.dart';
import 'package:astrology/providers/banner_provider.dart';
import 'package:astrology/providers/blogs_provider.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/providers/district_provider.dart';
import 'package:astrology/providers/gender_provider.dart';
import 'package:astrology/providers/network_provider.dart';
import 'package:astrology/providers/preferences_provider.dart';
import 'package:astrology/providers/user_provider.dart';
import 'package:astrology/splash_page.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppServicesProvider()),
        ChangeNotifierProvider(create: (_) => AstrologerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => BlogsProvider()),
        ChangeNotifierProvider(create: (_) => CountryProvider()),
        ChangeNotifierProvider(create: (_) => DistrictProvider()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
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
          scaffoldBackgroundColor: Colors.white,
          cardColor: ColorUtil.colorWhite,
          appBarTheme: const AppBarTheme(
            backgroundColor:
                Colors.white, // Set AppBar background color to white
            titleTextStyle: StyleUtil.style16DarkBlueBold,
            // iconTheme: IconThemeData(
            //   color: Colors.black, // Set AppBar icon color to black
            // ),
          ),
          cardTheme: const CardTheme(
            surfaceTintColor: ColorUtil.colorWhite,
            shadowColor: ColorUtil.colorGrey,
            color: ColorUtil.colorWhite,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Helvetica',
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return ColorUtil.colorOrange; // Color for the selected state
              } else if (states.contains(MaterialState.disabled)) {
                return ColorUtil.colorOrange; // Color for the disabled state
              }
              return ColorUtil
                  .colorOrange; // Color for the unselected state (inactive color)
            }),
          ),
        ),
        home: const SplashPage(),
        // home: const AstrologerDetailPage(),
        // home: const AstrologerListPage(),
        // home: const CompleteProfilePage(),
        // home: const LoginPage(),
        // home: const HomePage(),
        // home: const OTPVerifiedPage(
        //   isPhoneNumber: true,
        // ),
      ),
    );
  }
}
