import 'package:africa24/address_server.dart';
import 'package:africa24/colors.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ArticleContaine extends StatefulWidget {
  final String image;
  final String titre;
  final String resume;
  final String date;

  const ArticleContaine({
    Key? key,
    required this.image,
    required this.titre,
    required this.resume,
    required this.date,
  }) : super(key: key);

  @override
  _ArticleContaineState createState() => _ArticleContaineState();
}

class _ArticleContaineState extends State<ArticleContaine> {
  late double height,width;
  @override
  Widget build(BuildContext context) {
    final formath = DateFormat('HH:mm ');
    final formatdate = DateFormat('dd-MM-yyyy');
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: grey_c,
            elevation: 15,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(url + widget.image))),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only( left: 14.0,right: 17),
                              child: ColorFiltered(
                                colorFilter:const ColorFilter.mode( Colors.black45, BlendMode.saturation),
                                child: Text(widget.titre,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: KTextcolos,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const  Icon(FontAwesomeIcons.playCircle,size: 18, ),
                          const SizedBox(width: 5,),
                          Expanded(
                            flex: 2,
                            child: Text(
                              widget.resume,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.account_circle_rounded,
                                  color: containactcolor,
                                  size: 15.0,
                                ),
                                Text("la redaction",
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Row(
                              children:  [
                              const  Icon(
                                  Icons.watch_later_rounded,
                                  color: containactcolor,
                                  size: 15.0,
                                ),
                                Text( formatdate.format(DateTime.parse(widget.date)) +" | "+ formath.format(DateTime.parse(widget.date)),
                                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w900)),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
                Positioned(
                    left: width *.50,
                    top: height *.21,
                    child: Row(
                      children: [
                        MaterialButton(
                          child: const Icon(
                            FontAwesomeIcons.bookmark,
                            color:KPrimarycolor,size: 25,),
                          color: Colors.white,
                          shape: const CircleBorder(),
                          onPressed: () {  },),
                        MaterialButton(
                          child: const Icon(
                            FontAwesomeIcons.shareAlt,
                            color:KPrimarycolor,
                            size: 25,),
                          color: Colors.white,
                          shape: const CircleBorder(),
                          onPressed: () { Share.share("utilisé le lien suivant https://play.google.com/apps/internaltest/4698633430756078223 pour télécharger  l'application Africa 24" ); },),
                      ],
                    ))
              ],
            ),
          ),
        );
  }
}
