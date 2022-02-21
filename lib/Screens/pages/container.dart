import 'package:africa24/address_server.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/containeur/article.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';
import 'package:africa24/vue/articleview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class ContainerArticle extends StatefulWidget {
  const ContainerArticle({Key? key}) : super(key: key);

  @override
  _ContainerArticleState createState() => _ContainerArticleState();
}

class RIKey {
  static final riKey = GlobalKey<RefreshIndicatorState>();
}

class _ContainerArticleState extends State<ContainerArticle> {
  final HttpService httpService = HttpService();

  @override

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: RIKey.riKey,
      onRefresh: refreshlist,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Carouselcontainer(),
          FutureBuilder(
              future:  httpService.getPosts(),
              builder: (context,
                  AsyncSnapshot<List<Articles>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child:
                      Text('verifier votre connexion  ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<Articles> data = snapshot.data!;
                  return ListView.builder(
                    primary: false,
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ArticleView(
                                    body: data[index].body,
                                    resume: data[index].resume,
                                    title: data[index].title,
                                    subjet: data[index].category.title,
                                    video: data[index].video,
                                    image: data[index].image,
                                    date: data[index].createdAt,
                                  ))),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image:  DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black45, BlendMode.darken),
                                          image: NetworkImage(
                                            url+data[index].image,
                                          ))),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          color: Colors.blueGrey,
                                          child:  Text(
                                            data[index].category.title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Text( data[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: KTextcolos,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 8,
                                  right: 10,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          icon: const Icon(
                                              FontAwesomeIcons
                                                  .bookmark,
                                              color: KTextcolos,
                                              size: 20),
                                          onPressed: () {}),
                                      IconButton(
                                          icon: const Icon(
                                            FontAwesomeIcons.shareAlt,
                                            color: KTextcolos,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            Share.share(
                                                "utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24");
                                          })
                                    ],
                                  ))
                            ],
                          ),
                        );
                      } else if (index == 1) {
                        int indexplus = index + 1;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) => ArticleView(
                                          body: data[index].body,
                                          resume: data[index].resume,
                                          title: data[index].title,
                                          subjet: data[index].category.title,
                                          video: data[index].video,
                                          image: data[index].image,
                                          date: data[index].createdAt,
                                        ))),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              image:  DecorationImage(
                                                  fit: BoxFit.cover,
                                                  colorFilter: const ColorFilter.mode(
                                                      Colors.black45,
                                                      BlendMode.darken),
                                                  image: NetworkImage(
                                                    url +data[index].image,
                                                  ))),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(
                                                    padding:
                                                    const EdgeInsets.all(8),
                                                    color: Colors.blueGrey,
                                                    child: Text(
                                                      data[index].category.title,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    )),
                                                Text(data[index].title,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        color: KTextcolos,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.bold))
                                              ]),
                                        ),
                                        Positioned(
                                            right: -5,
                                            top: 1,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    icon: const Icon(
                                                      FontAwesomeIcons.bookmark,
                                                      color: KTextcolos,
                                                      size: 15,
                                                    ),
                                                    onPressed: () {}),
                                                IconButton(
                                                    icon: const Icon(
                                                      FontAwesomeIcons.shareAlt,
                                                      color: KTextcolos,
                                                      size: 15,
                                                    ),
                                                    onPressed: () {
                                                      Share.share(
                                                          "utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24");
                                                    }),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(right: 2, left: 1),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>ArticleView(
                                              body: data[indexplus].body,
                                              resume: data[indexplus].resume,
                                              title: data[indexplus].title,
                                              subjet: data[indexplus].category.title,
                                              video: data[indexplus].video,
                                              image: data[indexplus].image,
                                              date: data[indexplus].createdAt,
                                            ))),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              image:  DecorationImage(
                                                  fit: BoxFit.cover,
                                                  colorFilter:const  ColorFilter.mode(
                                                      Colors.black45,
                                                      BlendMode.darken),
                                                  image: NetworkImage(
                                                    url +data[indexplus].image,
                                                  ))),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(
                                                    padding:
                                                    const EdgeInsets.all(8),
                                                    color: Colors.blueGrey,
                                                    child: Text(
                                                      data[indexplus].category.title,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    )),
                                                Text(data[indexplus].title,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        color: KTextcolos,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.bold))
                                              ]),
                                        ),
                                        Positioned(
                                            right: -5,
                                            top: 1,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    icon: const Icon(
                                                        FontAwesomeIcons
                                                            .bookmark,
                                                        color: KTextcolos,
                                                        size: 15),
                                                    onPressed: () {}),
                                                IconButton(
                                                    icon: const Icon(
                                                      FontAwesomeIcons.shareAlt,
                                                      color: KTextcolos,
                                                      size: 15,
                                                    ),
                                                    onPressed: () {
                                                      Share.share(
                                                          "utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24");
                                                    }),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (index != 2) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ArticleView(
                                    body: data[index].body,
                                    resume: data[index].resume,
                                    title: data[index].title,
                                    subjet: data[index].category.title,
                                    video: data[index].video,
                                    image: data[index].image,
                                    date: data[index].createdAt,
                                  ))),
                          child: Container(
                            color: Colors.grey,
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                ArticleC(
                                  image: data[index].image,
                                  resume: data[index].resume,
                                  titre: data[index].title,
                                  subjet: data[index].category.title,
                                  date: data[index].createdAt,
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          color: Colors.white,
                        );
                      }
                    },
                  );
                } else {
                  return Container(
                    color: Colors.white,
                  );
                }
              }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Future<void> refreshlist() async {
    RIKey.riKey.currentState?.show(atTop: false);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      HttpService();
    });
  }
// ignore: non_constant_identifier_names

}

class Carouselcontainer extends StatefulWidget {
  const Carouselcontainer({Key? key}) : super(key: key);

  @override
  _CarouselcontainerState createState() => _CarouselcontainerState();
}

class _CarouselcontainerState extends State<Carouselcontainer> {
  final httpService = HttpService();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.Getunes(),
        builder:
            (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Articles> posts = snapshot.data!;
          return Column(
            children: [
              CarouselSlider(
                  items: posts
                      .map((data) => ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) =>  ArticleView(
                              body: data.body,
                              resume: data.resume,
                              title: data.title,
                              subjet: data.category.title,
                              video: data.video,
                              image: data.image,
                              date: data.createdAt,
                            ))),
                          child: Container(
                            width: 1050,
                            height: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black45,
                                        BlendMode.darken),
                                    image:
                                    NetworkImage(url + data.image))),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    color: jaune,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text(
                                        data.category.title,
                                        style: const TextStyle(
                                            color: KTextcolos),
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 100,
                                      color: KTextcolos,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Text(data.resume,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: KTextcolos,
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoPlayInterval: const Duration(seconds: 10),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: true)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: posts.map(
                      (e) {
                    int index = posts.indexOf(e);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? const Color.fromRGBO(0, 0, 0, 0.9)
                            : const Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          );
        });
  }
}
