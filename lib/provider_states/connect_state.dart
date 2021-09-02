import 'dart:io';
import 'package:app_builder/utils/connect_status_enum.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectState extends ChangeNotifier {
  ConnectEnStatus? _networkState;

  ConnectEnStatus? get networkState => _networkState;

  ConnectState() {
    Connectivity().checkConnectivity().then((value) => connectionChange(value));
    Connectivity().onConnectivityChanged.listen(connectionChange);
  }

  Future<void> connectionChange(ConnectivityResult connectivityResult) async {
    print('from connection status $connectivityResult');
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _networkState = ConnectEnStatus.Mobile;
      notifyListeners();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _networkState = ConnectEnStatus.WiFi;
      notifyListeners();
    } else {
      _networkState = ConnectEnStatus.Offline;
      print("No Internet Connection");
      notifyListeners();
    }
    if (_networkState != ConnectEnStatus.Offline) {
      _checkConnection(connectivityResult);
    }
  }

  //The test to actually see if there is a connection
  _checkConnection(ConnectivityResult connectivityResult) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // good connection
      } else {
        print("No Internet Connection");
      }
    } on SocketException catch (_) {
      print("No Internet Connection");
    }
  }
}
