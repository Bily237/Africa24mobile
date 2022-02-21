import 'package:africa24/address_server.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/vue/newsroomview.dart';
import 'package:flutter/material.dart';


class NewsroomVideo extends StatefulWidget {
  final String imag;
  final String title;
  final String subject;

  const NewsroomVideo({Key? key,
    required this.imag,
    required this.title,
    required this.subject}) : super(key: key);

  @override
  _NewsroomVideoState createState() => _NewsroomVideoState();
}

class _NewsroomVideoState extends State<NewsroomVideo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                url + widget.imag,
                              ))),
                      child: const Icon(
                        Icons.play_circle_outline,
                        size: 50.0,
                        color: KTextcolos,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children:[
                          Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.subject,
                                  style:const TextStyle(color:containactcolor,fontWeight: FontWeight.bold),
                                ),
                              )),
                       const   SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style:const TextStyle(fontWeight: FontWeight.bold),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_outline,
                              color: containactcolor,
                              size: 15.0,
                            ),
                            Text("la redaction",
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.watch_later_rounded,
                                color: containactcolor,
                                size: 15.0,
                              ),
                              Text("10 septembre 2021",
                                  style: TextStyle(fontSize: 15)),
                            ],
                          )),
                    ]),
              )
            ],
          ),
        ),
    );
  }
}