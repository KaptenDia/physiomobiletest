import 'package:injectable/injectable.dart';
import 'package:physiomobile/data/posts/posts_remote_data.dart';
import 'package:physiomobile/models/post_model.dart';
import 'package:physiomobile/models/result_resp.dart';

abstract class IPostsRepository {
  Future<ResultResp<List<Post>>> getPosts();
}

@LazySingleton(as: IPostsRepository)
class PostsRepository implements IPostsRepository {
  final IPostsRemoteData _iPostsRemoteData;

  PostsRepository(this._iPostsRemoteData);

  @override
  Future<ResultResp<List<Post>>> getPosts() async {
    final result = await _iPostsRemoteData.getPosts();
    return result is SuccessResp ? result : ErrorResp();
  }
}
