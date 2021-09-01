import 'package:app_builder/models/config_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class AppState extends ChangeNotifier {
  ConfigModel? _configModel;

  Stream<ConfigModel?> loadingConfigApp() async* {
    var path = 'lib/config/config.json';
    final appJson = await rootBundle.loadString(path);
    _configModel = ConfigModel.fromJson(convert.jsonDecode(appJson));
    notifyListeners();
    yield _configModel;
  }
}
