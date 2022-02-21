import 'package:africa24/colors.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class NewsRoomview extends StatefulWidget {
  const NewsRoomview({Key? key}) : super(key: key);

  @override
  _NewsRoomviewState createState() => _NewsRoomviewState();
}

class _NewsRoomviewState extends State<NewsRoomview> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NewsRoom"),
        actions: [
          IconButton(
              icon: Icon(actionIcon),
              onPressed: () {
                setState(() {
                  scrollDirection == Axis.horizontal
                      ? scrollDirection = Axis.vertical
                      : scrollDirection = Axis.horizontal;
                  actionIcon == Icons.swap_vert
                      ? actionIcon = Icons.swap_horiz
                      : actionIcon = Icons.swap_vert;
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState?.showSnackBar(
                    SnackBar(
                      content:
                      Text("Scroll Direction changed to $scrollDirection"),
                      duration: const Duration(milliseconds: 1000),
                    ),
                  );
                });
                controller.position.applyViewportDimension(
                    scrollDirection == Axis.vertical
                        ? _screenSize.height
                        : _screenSize.width);
              }),
          const IconButton(
              onPressed: null, icon: Icon(Icons.bookmark_border_rounded)),
          const IconButton(onPressed: null, icon: Icon(Icons.share))
        ],
      ),
      body: PageView.builder(
          itemCount: 10,
          controller: controller,
          scrollDirection: scrollDirection,
          pageSnapping: true,
          itemBuilder: (_, index) {
            return SingleChildScrollView(
              child: Card(
                  shadowColor: containactcolor,
                  color: Colors.white,
                  elevation: 8.8,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: BetterPlayer.network(
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                          betterPlayerConfiguration:
                          const BetterPlayerConfiguration(
                            aspectRatio: 16 / 9,
                          ),
                        ),
                      ),
                      const Card(
                        shadowColor: containactcolor,
                        color: containactcolor,
                        elevation: 15,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8, top: 5.0, right: 8, bottom: 5),
                          child: Text(
                            "03:27",
                            style: TextStyle(
                                color: KTextcolos,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Guinée : réouverture des frontières terrestres",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "En Guinée, le Comité national du rassemblement et du développement, annonce la réouverture prochaine des frontières terrestres avec le Sénégal. Pour le Comité, cette ouverture permettra aux pays de reprendre les activités commerciales effectuées sur cette voie de transit fermée depuis près d’une année.Vers une réouverture des frontières terrestres. En Guinée, le Comité national du rassemblement et du développement demande une évaluation sécuritaire et sanitaire du pays. Selon un communiqué, cette demande est initiée dans le but de procéder à l’ouverture graduelle des frontières du pays et plus particulièrement celle avec le Sénégal.En fin septembre 2020, Alpha Condé, le président déchu du pouvoir guinéen, avait annoncé la fermeture de plusieurs frontières dans le pays pour des raisons de sécurité. Selon Alpha Condé, cette décision visait à protéger le pays contre toute éventuelle attaque de jihadiste provenant des pays voisins de l’Afrique de l’Ouest.Pour les opérateurs économiques et commerçants guinéens, cette annonce est un soulagement pour différents secteurs notamment pour les transporteurs. Par ailleurs, le syndicaliste du pays assure que les transporteurs sont prêts à reprendre le travail dès l’ouverture officielle de la frontière. Par ailleurs, l’ouverture de la frontière avec le Sénégal est envisagée pour le 24 septembre 2021."),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
