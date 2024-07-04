import 'package:astrology/models/user/user.dart';
import 'package:astrology/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PreferencesProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveUser(User? user) async {
    final SharedPreferences prefs = await _prefs;
    String userJson = jsonEncode(user?.toJson());
    await prefs.setString(shared_preference_key, userJson);
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await _prefs;
    String? userJson = prefs.getString(shared_preference_key);
    if (userJson == null) {
      return null;
    }
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return User.fromJson(userMap);
  }

  Future<void> clearSession() async {
    final prefs = await _prefs;
    await prefs.clear(); // Clears all session data, including tokens
  }
}
