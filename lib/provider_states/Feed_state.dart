import 'package:app_builder/Server/api_request.dart';
import 'package:app_builder/helper/locator.dart';
import 'package:app_builder/helper/shared_prefrence_helper.dart';
import 'package:app_builder/models/config_model.dart';
import 'package:app_builder/models/post_model.dart';
import 'package:app_builder/utils/loading_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

enum FeedType { postType, webType, allPost }

class FeedState extends ChangeNotifier {
  FeedType? _feedType;
  String? _baseUrl;
  String? _webViewUrl;
  int? _userId;
  List<PostModel> _posts = [];
  PostModel _post = PostModel();
  ApiRequest _apiReq = ApiRequest();
  LoadingState _loadingState = LoadingState.Done;

  List<PostModel> get posts => _posts;

  PostModel get post => _post;

  LoadingState get viewState => _loadingState;
  String? get webViewUrl {
    return _webViewUrl == null ? null : _webViewUrl;
  }

  set webViewUrl(String? value) {
    print('[FeedState] webViewUrl : $value');
    _webViewUrl = value;
  }

  int? get userId {
    return _userId == null ? null : _userId;
  }

  set userId(int? value) {
    print('[FeedState] userId : $value');
    _userId = value;
  }

  FeedState() {
    loadingConfigApp();
  }

  FeedType? get feedType {
    return _feedType == null ? FeedType.allPost : _feedType;
  }

  FeedType? setFeedType(String compType) {
    print('[FeedState] setFeedType : $compType');
    if (compType == "posts") {
      _feedType = FeedType.postType;
    } else if (compType == "external-page") {
      _feedType = FeedType.webType;
    } else {
      _feedType = FeedType.allPost;
    }
    print('[FeedState] setFeedType Return : ${_feedType.toString()}');
    return _feedType;
  }

  Future<ConfigModel?> loadingConfigApp() async {
    _baseUrl = await getIt<SharedPreferenceHelper>().getBaseUrl();
    print('[FeedState] (loadingConfigApp) : $_baseUrl');
  }

  Future getPosts() async {
    if (_feedType == FeedType.postType && userId != null) {
      await getPostsByUserId(apiName: "posts", userId: userId);
    } else {
      await getAllPosts("posts");
    }
    notifyListeners();
  }

  Future getAllPosts(String apiName) async {
    _loadingState = LoadingState.Loading;
    notifyListeners();
    var data = await _apiReq.getPosts(apiName);
    data.forEach((element) {
      _posts.add(PostModel.fromJson(element));
    });
    _loadingState = LoadingState.Done;
    notifyListeners();
  }

  Future getPostsByUserId(
      {required String? apiName, required int? userId}) async {
    _loadingState = LoadingState.Loading;
    notifyListeners();
    List data = await _apiReq.getPostsById(typePostCo: apiName, userId: userId);
    if (data.isNotEmpty) {
      _posts = [];
      data.forEach((element) {
        _posts.add(PostModel.fromJson(element));
      });
      _loadingState = LoadingState.Done;
      notifyListeners();
    } else {
      print("user id is unknown");
      getAllPosts(apiName!);
    }
  }
}
