import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/data/posts/posts_repository.dart';
import 'package:physiomobile/di/di.dart';
import 'package:physiomobile/exlib.dart';
import 'package:physiomobile/models/post_model.dart';
import 'package:physiomobile/models/result_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

final postsProvider =
    ChangeNotifierProvider.autoDispose<PostsState>((ref) => PostsState());

class PostsState extends BaseState {
  List<Post> postList = [];

  PostsState() {
    fetchPosts();
  }

  final _cacheKey = 'cached_posts';

  void fetchPosts() async {
    setLoading(true);
    final resp = await getIt<IPostsRepository>().getPosts();
    checkStatusResp.check(
      resp,
      onSuccess: () async {
        final data = (resp as SuccessResp<List<Post>>).data;
        postList.clear();
        postList.addAll(data ?? []);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
            _cacheKey, jsonEncode(postList.map((e) => e.toJson()).toList()));
      },
      onFailure: () async {
        final prefs = await SharedPreferences.getInstance();
        final cachedJson = prefs.getString(_cacheKey);
        if (cachedJson != null) {
          final list = (jsonDecode(cachedJson) as List)
              .map((e) => Post.fromJson(e))
              .toList();
          postList.clear();
          postList.addAll(list);
        }
      },
    );
    setLoading(false);
  }
}
