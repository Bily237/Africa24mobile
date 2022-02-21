import 'package:africa24/Screens/home.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';

import 'package:africa24/vue/categorieview.dart';
import 'package:flutter/material.dart';

class Drawer_H extends StatefulWidget {
  const Drawer_H({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer_H> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Kbuttoncolor, KPrimarycolor],
            end: Alignment.center,
            begin: Alignment.bottomCenter),
      ),
      child: FutureBuilder(
          future: httpService.getMenu(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> posts = snapshot.data!;

              return ListView(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50.0, bottom: 20.0, left: 30.0, right: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    return Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/Logo_Africa_24.jpg'),
                                  radius: 60.0,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                " Les infos d'Afrique pour le monde, les infos du monde pour l'Afrique ",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 12.0,
                                    color: KTextcolos),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: greyLightModeColor.withOpacity(0.8),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Homecreen())),
                        child: const ListTile(
                          leading: Icon(Icons.home, color: Colors.grey),
                          title: Text(
                            "home",
                            style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 16.0,
                                color: KTextcolos),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: greyLightModeColor.withOpacity(0.8),
                    ),
                    Column(
                      children: posts.map((Category post) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CategorieView(slug: post);
                            })),
                            child: ListTile(
                              leading: const Icon(Icons.label_rounded,
                                  color: Colors.grey),
                              title: Text(
                                post.title,
                                style: const TextStyle(
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: 16.0,
                                    color: KTextcolos),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Divider(
                      color: greyLightModeColor.withOpacity(0.8),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Homecreen())),
                        child: const ListTile(
                          leading: Icon(Icons.settings_applications,
                              color: Colors.grey),
                          title: Text(
                            "Paramètre",
                            style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 16.0,
                                color: KTextcolos),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Homecreen())),
                        child: const ListTile(
                          leading: Icon(Icons.feedback, color: Colors.grey),
                          title: Text(
                            "À propos de nous",
                            style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 16.0,
                                color: KTextcolos),
                          ),
                        ),
                      ),
                    ),
                  ]);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}