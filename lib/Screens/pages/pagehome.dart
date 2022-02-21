import 'package:africa24/address_server.dart';
import 'package:africa24/colors.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/actualite.dart';
import 'package:africa24/model/banners.dart';
import 'package:africa24/vue/filactualiteview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'container.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final httpService = HttpService();
  final List<String> image = [
    'assets/images/baniere-2.jpg',
    "assets/images/baniere-2.jpg",
    "assets/images/baniere-2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                CarouselBanners(),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  height: 25,
                  color: containactcolor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        color: KPrimarycolor,
                        child: const Icon(
                          Icons.bolt_outlined,
                          color: jaune,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Carouselactualite())
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: ContainerArticle(),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Carouselactualite() {
    return FutureBuilder(
        future: httpService.getscrolls(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Actualite>> snapshot) {
          if (snapshot.hasData) {
            List<Actualite> posts = snapshot.data!;

            return CarouselSlider(
                items: posts
                    .map(
                      (e) => InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                FilDactualite(actu: e.title))),
                    child: Text(
                      e.title,
                      style: const TextStyle(color: KTextcolos),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                    .toList(),
                options: CarouselOptions(
                    height: 91,
                    scrollDirection: Axis.vertical,
                    autoPlayInterval: const Duration(seconds: 10),
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1));
          } else {
            return Center(
                child: Container(
                  color: containactcolor,
                ));
          }
        });
  }
  Widget CarouselBanners() {
    return FutureBuilder(
        future:  httpService.getbanners(),
        builder:(BuildContext context, AsyncSnapshot<List<Banners>> snapshot){
    if (snapshot.hasData) {
      List<Banners> posts = snapshot.data!;
      return  CarouselSlider(
          items: posts.map(
                (e) =>  Image.network( url +
              e.path,
            ),

          )
              .toList(),
          options: CarouselOptions(
              height: 33.3,
              scrollDirection: Axis.horizontal,
              autoPlayInterval: const Duration(seconds: 10),
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1));

    }else {
      return Center(
          child: Container(
            color: containactcolor,
          ));
    }

        } ,

    );

  }
}
