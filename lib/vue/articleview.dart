import 'package:africa24/Screens/drawer.dart';

import 'package:africa24/colors.dart';
import 'package:africa24/containeur/articlecontainer.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ArticleView extends StatefulWidget {
  final String body;
  final String resume;
  final String title;
  final String subjet;
  final String date;

  final String video;
  final String image;

  const ArticleView(
      {Key? key,
        required this.body,
        required this.resume,
        required this.title,
        required this.subjet,
        required this.video,
        required this.image,
        required this.date})
      : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final HttpService httpService = HttpService();
  late YoutubePlayerController _controller;
  void runYoutubePlayer(){

    _controller=YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.video)!,
        flags: const YoutubePlayerFlags(

          isLive: false,

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
    final formath = DateFormat('HH:mm ');
    final formatdate = DateFormat('dd-MM-yyyy');
    return YoutubePlayerBuilder(player: YoutubePlayer(
      controller: _controller,
    ), builder: (context,player){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Articles"),
          actions: [
            const IconButton(
                onPressed: null, icon: Icon(Icons.bookmark_border_rounded)),
            IconButton(
                onPressed: () {
                  Share.share(
                      "utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24");
                },
                icon: const Icon(Icons.share))
          ],
        ),
        drawer: const Drawer(
          elevation: 5.0,
          child: Drawer_H(), // la drawer
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                player,
                Padding(
                  padding:
                  const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 9),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.resume,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, height: 1.5),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.circle,
                            color: Colors.grey,
                          ),
                          Text("écrit par Africa24",
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Colors.grey,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              formatdate.format(DateTime.parse(widget.date)) +
                                  " à " +
                                  formath.format(DateTime.parse(widget.date)),
                              style:
                              const TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Html(data: widget.body),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Autre acticles",
                          style: TextStyle(fontSize: 14, color: KPrimarycolor)),
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 20,
                        endIndent: 20,
                      ),
                      FutureBuilder(
                          future: httpService.getPosts(),
                          builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      'verifier votre connexion internet ${snapshot.error}'));
                            } else if (snapshot.hasData) {
                              List<Articles> data = snapshot.data!;
                              return ListView.builder(
                                  primary: false,
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    if ((data[index].resume != widget.resume) &&
                                        (data[index].category.title ==
                                            widget.subjet)) {
                                      return GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (context) =>ArticleView(
                                              body: data[index].body,
                                              resume: data[index].resume,
                                              title: data[index].title,
                                              subjet: data[index].category.title,
                                              video: data[index].video,
                                              image: data[index].image,
                                              date: data[index].createdAt,
                                            ))),
                                        child: ContainerArticle2(
                                            resume: data[index].resume,
                                            image: data[index].image,
                                            subject:
                                            data[index].category.title),
                                      );
                                    } else {
                                      return Container(
                                        color: Colors.white,
                                      );
                                    }
                                  });
                            } else {
                              return const Center(child: CircularProgressIndicator());
                            }
                          }),
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}
