import 'dart:convert';

class MainCgModel {
  String? baseUrl;

  MainCgModel({this.baseUrl});

  MainCgModel.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'] ?? 'https://jsonplaceholder.typicode.com';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseUrl'] = this.baseUrl;
    return data;
  }

  @override
  String toString() => 'MainCgModel ${jsonEncode(toJson())}';
}
