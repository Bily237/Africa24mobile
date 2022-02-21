
import 'package:africa24/containeur/newsroomvideo.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';
import 'package:africa24/vue/articleview.dart';
import 'package:flutter/material.dart';


class Search extends SearchDelegate {
  final ArticlesList _articleList = ArticlesList();
  late double height;
  late double width;
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon:const Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon:const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return FutureBuilder<List<Articles>>(
        future: _articleList.getArticleList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Articles> data = snapshot.data!;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
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
                  child: NewsroomVideo(imag:data[index].image, title:data[index].title, subject:data[index].category.title,)
                );
              });
        });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Rechercher des articles'),
    );
  }
}
