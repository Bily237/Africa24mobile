import 'package:africa24/colors.dart';
import 'package:africa24/vue/newsroomview.dart';
import 'package:flutter/material.dart';

class NewsRoom extends StatelessWidget {
  const NewsRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 10,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewsRoomview())),
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
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/sociéte.jpg"))),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: const [
                          Text(
                            "Côte d’Ivoire : le ministre Siandou Fofana élu président du Comité exécutif de la section Afrique l’Organisation mondiale du Tourisme",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(

                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Voir plus ...",
                                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 8),
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
      ),
    );
  }
}