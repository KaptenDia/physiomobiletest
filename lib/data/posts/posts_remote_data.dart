import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:physiomobile/const/url.dart';
import 'package:physiomobile/di/di.dart';
import 'package:physiomobile/models/post_model.dart';
import 'package:physiomobile/models/result_resp.dart';

abstract class IPostsRemoteData {
  Future<ResultResp<List<Post>>> getPosts();
}

@LazySingleton(as: IPostsRemoteData)
class PostsRemoteData implements IPostsRemoteData {
  final Dio _dio = getIt<Dio>();

  @override
  Future<ResultResp<List<Post>>> getPosts() async {
    try {
      final result = await _dio.get(url);
      final data = result.data as List;
      final posts = data.map((e) => Post.fromJson(e)).toList();
      return SuccessResp.fromJson({"code": "200", "message": "Success"}, posts);
    } catch (e) {
      log(e.toString());
      return ErrorResp(message: 'Internal Error');
    }
  }
}
