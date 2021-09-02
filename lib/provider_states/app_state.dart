import 'package:app_builder/helper/locator.dart';
import 'package:app_builder/helper/shared_prefrence_helper.dart';
import 'package:app_builder/models/config_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class AppState extends ChangeNotifier {
  ConfigModel? _configModel;

  AppState() {
    loadingConfigApp();
  }

  ConfigModel? get configModel {
    return _configModel;
  }

  Future<ConfigModel?> loadingConfigApp() async {
    var path = 'lib/config/config.json';
    final appJson = await rootBundle.loadString(path);

    _configModel = ConfigModel.fromJson(convert.jsonDecode(appJson));
    getIt<SharedPreferenceHelper>().saveBaseUrl(_configModel!);
    notifyListeners();
    return _configModel;
  }
}
