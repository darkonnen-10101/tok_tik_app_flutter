import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

import '../../infrastructure/repositories/video_posts_repository_impl.dart';
// import 'package:tok_tik_app/infrastructure/models/local_video_model.dart';
// import 'package:tok_tik_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoryImpl videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
