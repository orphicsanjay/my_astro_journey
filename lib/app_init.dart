import 'package:astrology/locator.dart';
import 'package:flutter/material.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
  }
}
