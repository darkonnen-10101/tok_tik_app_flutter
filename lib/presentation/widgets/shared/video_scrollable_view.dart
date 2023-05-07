import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_buttons.dart';

import '../video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                  caption: videoPost.caption, videoUrl: videoPost.videoUrl),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                videoPost: videoPost,
              ),
            )
          ],
        );
      },
      // children: [
      //   Container(color: Colors.red),
      //   Container(color: Colors.blue),
      //   Container(color: Colors.teal),
      //   Container(color: Colors.yellow),
      //   Container(color: Colors.pink),
      //   Container(color: Colors.purple),
      // ],
    );
  }
}
