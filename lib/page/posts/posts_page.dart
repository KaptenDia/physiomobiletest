import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/models/post_model.dart';
import 'package:physiomobile/page/posts/posts_provider.dart';
import 'package:physiomobile/themes/themes.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: appColors.backgroundPrimary,
        title: const Text("Posts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(postsProvider).fetchPosts();
            },
          )
        ],
      ),
      backgroundColor: appColors.backgroundPrimary,
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.postList.isEmpty
              ? const Center(child: Text("No posts found"))
              : RefreshIndicator(
                  color: appColors.primary,
                  backgroundColor: appColors.backgroundPrimary,
                  onRefresh: () async {
                    ref.read(postsProvider).fetchPosts();
                  },
                  child: ListView.builder(
                    itemCount: provider.postList.length,
                    itemBuilder: (context, index) =>
                        _ListItem(provider.postList[index]),
                  ),
                ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Post? post;
  const _ListItem(
    this.post,
  );
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post?.title ?? "-"),
      subtitle: Text(post?.body ?? "-"),
    );
  }
}
