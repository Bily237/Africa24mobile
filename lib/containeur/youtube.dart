import 'package:africa24/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  final String url;
  const Youtube({Key? key,required this.url}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer(){

    _controller=YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(

        isLive: true,

      )

    );

  }
  @override
  void initState(){
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
    
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(player: YoutubePlayer(
      controller: _controller,
    ), builder: (context,player){
      return Scaffold(
        backgroundColor: KPrimarycolor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const SizedBox(height: 80.0,),
             const  Text("Regardez AFRICA 24 LIVE",style: TextStyle( color: KTextcolos,
            fontWeight: FontWeight.bold, fontSize: 25),
        ),
             const SizedBox(height: 40.0,),
              player,
              const SizedBox(height: 40.0,),
              Image.asset("assets/images/logo.png"),
            ],
          ),
      );
    });
  }
}
