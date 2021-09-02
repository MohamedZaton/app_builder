import 'package:app_builder/helper/locator.dart';
import 'package:app_builder/helper/shared_prefrence_helper.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  //https://jsonplaceholder.typicode.com/posts?userId=1

  Future<List<dynamic>> getPosts(String typePostCo) async {
    String? baseUrl = await getIt<SharedPreferenceHelper>().getBaseUrl();
    String url = "$baseUrl/$typePostCo";
    try {
      Response response = await Dio().get(url);
      var data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future getPostsById(
      {required String? typePostCo, required int? userId}) async {
    String? baseUrl = await getIt<SharedPreferenceHelper>().getBaseUrl();
    String url = "$baseUrl/$typePostCo";
    Map<String, dynamic>? params = {
      "userId": userId,
    };
    try {
      Response response = await Dio().get(
        url,
        queryParameters: params,
      );
      var data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      return [];
    }
  }
}
