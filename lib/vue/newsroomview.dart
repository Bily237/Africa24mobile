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
                        "Guin??e : r??ouverture des fronti??res terrestres",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "En Guin??e, le Comit?? national du rassemblement et du d??veloppement, annonce la r??ouverture prochaine des fronti??res terrestres avec le S??n??gal. Pour le Comit??, cette ouverture permettra aux pays de reprendre les activit??s commerciales effectu??es sur cette voie de transit ferm??e depuis pr??s d???une ann??e.Vers une r??ouverture des fronti??res terrestres. En Guin??e, le Comit?? national du rassemblement et du d??veloppement demande une ??valuation s??curitaire et sanitaire du pays. Selon un communiqu??, cette demande est initi??e dans le but de proc??der ?? l???ouverture graduelle des fronti??res du pays et plus particuli??rement celle avec le S??n??gal.En fin septembre 2020, Alpha Cond??, le pr??sident d??chu du pouvoir guin??en, avait annonc?? la fermeture de plusieurs fronti??res dans le pays pour des raisons de s??curit??. Selon Alpha Cond??, cette d??cision visait ?? prot??ger le pays contre toute ??ventuelle attaque de jihadiste provenant des pays voisins de l???Afrique de l???Ouest.Pour les op??rateurs ??conomiques et commer??ants guin??ens, cette annonce est un soulagement pour diff??rents secteurs notamment pour les transporteurs. Par ailleurs, le syndicaliste du pays assure que les transporteurs sont pr??ts ?? reprendre le travail d??s l???ouverture officielle de la fronti??re. Par ailleurs, l???ouverture de la fronti??re avec le S??n??gal est envisag??e pour le 24 septembre 2021."),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
