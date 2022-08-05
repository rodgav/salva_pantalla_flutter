import 'dart:async';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class BlockPage extends StatefulWidget {
  final VoidCallback blockPop;

  const BlockPage(this.blockPop, {Key? key}) : super(key: key);

  @override
  State<BlockPage> createState() => _BlockPageState();
}

class _BlockPageState extends State<BlockPage> {
  late VideoPlayerController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/salvapantalla.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
    _rePlayVideo();
  }

  _rePlayVideo() {
    print('replay');
    //77 is seconds video
    _timer = Timer(const Duration(seconds: 80), () {
      _rePlayVideo();
      _controller.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.blockPop.call(),
      onTapDown: (_) => widget.blockPop.call(),
      onTapUp: (_) => widget.blockPop.call(),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : Container(),
      ),
    );
  }
}
