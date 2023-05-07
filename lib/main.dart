import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/config/app_theme.dart';
import 'package:tok_tik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover/discover_screen.dart';

import 'infrastructure/repositories/video_posts_repository_impl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPostsRepositoryImpl videoPostRepository =
        VideoPostsRepositoryImpl(
      videosDataSource: LocalVideoDataourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)
            ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
