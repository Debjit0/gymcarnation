import 'package:flutter/material.dart';

import '../widgets/video_player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: VideoPlayerWidget(videoPath: 'assets/gymcarnationLogin1.mp4'),
      ),
    );
  }
}
