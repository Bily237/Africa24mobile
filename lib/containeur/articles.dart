import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  final String titre;
  final String resume;
  final String image;
  final String subject;

  const Article(
      {Key? key,
        required this.titre,
        required this.resume,
        required this.image,
        required this.subject})
      : super(key: key);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: KPrimarycolor,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 8),
            child: Text(
              widget.titre,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24, color: KTextcolos),
            ),
          ),
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.image))),
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: Kbuttoncolor,
                          child: Text(
                            widget.subject,
                            style: const TextStyle(
                                color: jaune, fontWeight: FontWeight.bold),
                          )),
                    ]),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                color: KTextcolos,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.resume,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}