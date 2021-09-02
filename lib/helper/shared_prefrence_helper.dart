import 'dart:convert';

import 'package:app_builder/models/config_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();
  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  Future clearPreferenceValues() async {
    await (SharedPreferences.getInstance())
      ..clear();
  }

  Future<void> saveBaseUrl(ConfigModel configModel) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "configBaseUrl", configModel.mainConfig!.baseUrl.toString());
  }

  Future<String?> getBaseUrl() async {
    final baseUrl =
        (await SharedPreferences.getInstance()).getString("configBaseUrl");
    if (baseUrl == null) return null;
    return baseUrl.toString();
  }
}

enum UserPreferenceKey { AccessToken, UserProfile, UserName, IsFirstTimeApp }
