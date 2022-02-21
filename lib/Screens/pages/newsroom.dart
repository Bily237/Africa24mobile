import 'package:africa24/colors.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/articles.dart';
import 'package:africa24/vue/categorieview.dart';
import 'package:flutter/material.dart';


class RegionPage extends StatefulWidget {
  const RegionPage({Key? key}) : super(key: key);

  @override
  _RegionPageState createState() => _RegionPageState();
}
class RIKeys {
  static final riKey1 = GlobalKey<RefreshIndicatorState>();
}
class _RegionPageState extends State<RegionPage> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: RIKeys.riKey1,
      onRefresh: refreshlist,
      child: FutureBuilder(
          future: httpService.getRegions(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'verifier votre connexion internet ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Category> posts = snapshot.data!;
              return Container(
                color: black_claire,
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: GridView.count(
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      children: posts.map((Category cat) {
                        return GestureDetector(
                          onTap: () =>  Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return CategorieView(slug: cat);
                          })),
                          child: GridTile(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, top: 8, right: 5),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black54, BlendMode.darken),
                                          image: AssetImage(
                                            "assets/images/Logo_Africa_24.jpg",
                                          ))),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(cat.title,
                                            style: const TextStyle(
                                                color: KTextcolos,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                ),
                              )),
                        );
                      }).toList(),
                    )),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
  Future<void> refreshlist() async {
    RIKeys.riKey1.currentState?.show(atTop: false);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      HttpService();
    });
  }
}
