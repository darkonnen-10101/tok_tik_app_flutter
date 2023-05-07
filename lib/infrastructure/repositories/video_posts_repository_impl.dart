import 'package:tok_tik_app/domain/datasources/video_posts_datasource.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

import '../../domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videosDataSource;

  VideoPostsRepositoryImpl({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
