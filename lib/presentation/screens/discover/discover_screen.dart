import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';

import '../../widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscoverProvider discoverProvider = context.watch<DiscoverProvider>();

    // final otroProvider = Provider.of<DiscoverProvider>(context, listen: false); -> context.read()

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : VideoScrollableView(
                videos: discoverProvider.videos,
              ));
  }
}
