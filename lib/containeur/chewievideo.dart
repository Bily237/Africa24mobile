import 'package:africa24/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class Videochewie extends StatefulWidget {
  const Videochewie({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  final VideoPlayerController videoPlayerController;

  @override
  _VideochewieState createState() => _VideochewieState();
}

class _VideochewieState extends State<Videochewie> {
  late ChewieController _chewieController;

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: true,
      aspectRatio: 1 / 1,
      autoInitialize: true,
      looping: true,

      // Try playing around with some of these other options:

      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: KPrimarycolor,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Chewie(controller: _chewieController);
  }
}

class Videoplay extends StatefulWidget {
  const Videoplay({Key? key, required this.videodata}) : super(key: key);

  final String videodata;

  @override
  _VideoplayState createState() => _VideoplayState();
}

class _VideoplayState extends State<Videoplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KPrimarycolor,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: KPrimarycolor,
        child: Videochewie(
          videoPlayerController:
          VideoPlayerController.network(widget.videodata),
        ),
      ),
    );
  }
}