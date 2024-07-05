import 'dart:convert';

import 'package:astrology/models/user/access_token.dart';
import 'package:astrology/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AccessToken? _accessToken;
  AccessToken? get accessToken => _accessToken;

  PreferencesProvider() {
    _loadAccessToken();
  }

  Future<void> _loadAccessToken() async {
    _accessToken = await getAccessToken();
    notifyListeners();
  }

  saveAccessToken(AccessToken? accessToken) async {
    final SharedPreferences prefs = await _prefs;
    String accessTokenJson = jsonEncode(accessToken?.toJson());
    await prefs.setString(shared_preference_key, accessTokenJson);
    _accessToken =
        accessToken != null ? AccessToken.fromJson(accessToken.toJson()) : null;
    notifyListeners();
  }

  Future<AccessToken?> getAccessToken() async {
    final SharedPreferences prefs = await _prefs;
    String? accessTokenJson = prefs.getString(shared_preference_key);
    if (accessTokenJson == null) {
      return null;
    }
    Map<String, dynamic> accessTokenMap = jsonDecode(accessTokenJson);
    return AccessToken.fromJson(accessTokenMap);
  }

  Future<void> clearSession() async {
    final prefs = await _prefs;
    await prefs.clear();
    _accessToken = null;
    notifyListeners();
  }
}
