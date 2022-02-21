import 'package:africa24/Screens/drawer.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/containeur/articlecontain.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';
import 'package:africa24/vue/articleview.dart';

import 'package:flutter/material.dart';

class CategorieView extends StatefulWidget {
  final Category slug;
  const CategorieView({Key? key, required this.slug}) : super(key: key);

  @override
  _CategorieViewState createState() => _CategorieViewState();
}

class _CategorieViewState extends State<CategorieView> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: const Drawer(
        elevation: 5.0,
        child: Drawer_H(), // la drawer
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            actions: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
            stretch: true,
            backgroundColor: KPrimarycolor,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/logo.png",
                height: 50,
                width: 50,
              ),
              stretchModes: const [
                // StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
              title: Text(widget.slug.title),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  FutureBuilder(
                      future: httpService.getCategory(widget.slug.slug),
                      builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(' ${snapshot.error}'),
                          );
                        } else if (snapshot.hasData) {
                          List<Articles> data = snapshot.data!;

                          return ListView.builder(
                              primary: false,
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                  return GestureDetector(
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
                                    child: ArticleContaine(
                                      image: data[index].image,
                                      resume: data[index].resume,
                                      titre: data[index].title,
                                      date: data[index].createdAt,
                                    ),
                                  );

                              });
                        } else {
                          return Container(
                            color: Colors.white,
                          );
                        }
                      })
                ],
              ))
        ],
      ),
    );
  }
}
