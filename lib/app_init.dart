import 'package:astrology/bloc/app_bloc_observer.dart';
import 'package:astrology/dependency_injection.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/color_util.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    // setupLocator();
    await initDependencyInjection();
  }

  static final ThemeData customThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    cardColor: ColorUtil.colorWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: StyleUtil.style16DarkBlueBold,
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: ColorUtil.colorWhite,
      shadowColor: ColorUtil.colorGrey,
      color: ColorUtil.colorWhite,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: 'Helvetica',
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return ColorUtil.colorOrange;
          } else if (states.contains(MaterialState.disabled)) {
            return ColorUtil.colorOrange;
          }
          return ColorUtil.colorOrange;
        },
      ),
    ),
  );
}
