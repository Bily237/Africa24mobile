import 'package:africa24/Screens/drawer.dart';
import 'package:africa24/Screens/pages/agenda.dart';
import 'package:africa24/Screens/pages/connexion.dart';
import 'package:africa24/Screens/pages/newsexpress.dart';
import 'package:africa24/Screens/pages/newsroom.dart';
import 'package:africa24/Screens/pages/pagehome.dart';
import 'package:africa24/Screens/pages/programmepage.dart';
import 'package:africa24/Screens/pages/search.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/containeur/youtube.dart';
import 'package:flutter/material.dart';

class Homecreen extends StatelessWidget {
  const Homecreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 5,
    child: Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Image.asset(
          "assets/images/logo.png",
          height: 90,
          width: 90,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [KPrimarycolor, Kbuttoncolor],
                begin: Alignment.bottomCenter),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () =>
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Youtube(url: "https://www.youtube.com/watch?v=P6RQlQycxp8&ab_channel=Koratek",),
                    )),
                icon: const Icon(
                  Icons.videocam_outlined,
                  size: 21,
                ),
                label: const Text(
                  "EN DIRECT",
                  style: TextStyle(fontSize: 9),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              IconButton(
                  onPressed: () => showSearch(context: context, delegate: Search()),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  )),
            ],
          ),
          Theme(
            data: Theme.of(context).copyWith(
                dividerColor: Colors.white30,
                iconTheme: const IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'paramètres',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'partager',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Connexion',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))
                ]),
          )
        ],
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.widgets_rounded,
                size: 20,
              ),
              text: "Nos Programmes",
            ),
            Tab(
              icon: Icon(
                Icons.description_rounded,
                size: 20,
              ),
              text: "NewsExpress",
            ),
            Tab(
              icon: Icon(
                Icons.public_rounded,
                size: 20,
              ),
              text: "Actu Regions",
            ),
            Tab(
              icon: Icon(
                Icons.calendar_today_sharp,
                size: 20,
              ),
              text: "Agenda",
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        elevation: 5.0,
        child: Drawer_H(), // la drawer
      ),
      body: const TabBarView(
        children: [
          PageHome(),
          ProgrammePage(),
          NewsEpresssPage(),
          RegionPage(),
          Agenda(),
        ],
      ),
    ),
  );

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Connexion(),
        ));
        break;
    }
  }
}
