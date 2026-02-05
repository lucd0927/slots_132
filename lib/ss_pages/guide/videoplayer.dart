import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({
    super.key,
    required this.onStart,
    required this.onEnd,
    required this.asset,
  });

  final VoidCallback onStart;
  final VoidCallback onEnd;
  final String asset;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.asset,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  bool hasCompleted = false;

  init() async {
    try {
      await _controller.initialize();
      ssLogggg("==initialize==${_controller.value.isInitialized}");
      _controller.play();
      _controller.setVolume(0);
      if (mounted) {
        setState(() {});
      }
      widget.onStart();
      _controller.addListener(() {
        bool tmphasCompleted = _controller.value.isCompleted;
        ssLogggg("=√=addListener==hasCompleted:$tmphasCompleted");
        if (tmphasCompleted && !hasCompleted) {
          hasCompleted = true;
          widget.onEnd();
        }
      });
    } catch (e) {
      ssLogggg("==initialize==error:$e");
      widget.onEnd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller != null && _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: ScreenUtil().screenWidth / ScreenUtil().screenHeight,
              // aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(color: Colors.transparent),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
