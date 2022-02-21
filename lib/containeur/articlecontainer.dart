import 'package:africa24/address_server.dart';
import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class ContainerArticle2 extends StatefulWidget {
  final String resume;
  final String image;

  final String subject;

  const ContainerArticle2(
      {Key? key,
        required this.resume,
        required this.image,
        required this.subject})
      : super(key: key);

  @override
  _ContainerArticle2State createState() => _ContainerArticle2State();
}

class _ContainerArticle2State extends State<ContainerArticle2> {
  late double height,width;
  @override
  Widget build(BuildContext context) {

    height=MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Colors.black45, BlendMode.darken),
                          image: NetworkImage(
                            url + widget.image,
                          ))),
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
                      Text(widget.resume,
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
              const Divider(
                height: 40,
                thickness: 2,
                color: Kbuttoncolor,
              ),
            ],
          ),
          Positioned(
              left: width *.6,
              bottom: height *.22,
              child: Row(
                children: [
                  IconButton(icon: const Icon( FontAwesomeIcons.bookmark,color:KTextcolos,size: 25,), onPressed: () {  },),
                  const SizedBox(width: 5,),
                  IconButton(icon:
                  const Icon(
                    FontAwesomeIcons.shareAlt,
                    color:KTextcolos,
                    size: 25,),
                      onPressed: () {
                        Share.share("utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24" );
                      }),
                ],
              ))
        ],
      ),
    );
  }
}
