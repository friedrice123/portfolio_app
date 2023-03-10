import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


final VideoPlayerController videoPlayerController;
final bool looping;
final bool autoplay;


VideoItems({
  @required this.videoPlayerController,
  this.looping, this.autoplay,
  Key key,
}) : super(key: key);
@override
void initState() {
  super.initState();
  _chewieController = ChewieController(
    videoPlayerController: widget.videoPlayerController,
    aspectRatio:5/8,
    autoInitialize: true,
    autoPlay: widget.autoplay,
    looping: widget.looping,
    errorBuilder: (context, errorMessage) {
      return Center(
        child: Text(
          errorMessage,
          style: TextStyle(color: Colors.white),
        ),
      );
    },
  );
}
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chewie(
      controller: _chewieController,
    ),
  );
}
@override
void dispose() {
  super.dispose();
  _chewieController.dispose();
}