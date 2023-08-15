import 'package:flutter/material.dart';
import 'package:gymcarnation/views/widgets/video_player_widget.dart';

class EnterMobileScreen extends StatelessWidget {
  const EnterMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VideoPlayerWidget(videoPath: 'assets/gymcarnationLogin1.mp4'),
          
        ],
      ),
    );
  }
}
