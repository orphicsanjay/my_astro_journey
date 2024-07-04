import 'package:astrology/models/user/user.dart';
import 'package:astrology/providers/preferences_provider.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  final PreferencesProvider _preferencesProvider;

  UserProvider(this._preferencesProvider) {
    initUser();
  }

  initUser() async {
    // ignore: unused_local_variable
    _user = await _preferencesProvider.getUser();
  }
}
