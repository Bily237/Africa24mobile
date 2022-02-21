import 'package:africa24/colors.dart';
import 'package:africa24/fonctionanimation/expansionvanille.dart';
import 'package:flutter/material.dart';

class NewsExpress extends StatefulWidget {
  final String title;
  final String resume;
  final String date;
  final String time;
  const NewsExpress({
    Key? key,
    required this.title,
    required this.resume,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  _NewsExpressState createState() => _NewsExpressState();
}

class _NewsExpressState extends State<NewsExpress> {
  @override
  Widget build(BuildContext context) {
    return VanillaExpansion(
      title: widget.title,
      date: widget.date,
      time: widget.time,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: Card(
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: KPrimarycolor,
                  ),
                  color: KTextcolos,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.resume,
                  style: const TextStyle(color: Colors.black,height: 1.5),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
