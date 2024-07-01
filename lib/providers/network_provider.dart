import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkProvider with ChangeNotifier {
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  final Connectivity _connectivity = Connectivity();

  NetworkProvider() {
    initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    notifyListeners();
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    notifyListeners();
  }
}
