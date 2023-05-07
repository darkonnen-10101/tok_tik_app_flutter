import 'package:tok_tik_app/domain/datasources/video_posts_datasource.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);
}
