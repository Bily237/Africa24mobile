import 'package:africa24/containeur/newsroom.dart';
import 'package:africa24/http_request.dart';


import 'package:flutter/material.dart';

class Favoris extends StatefulWidget {
  const Favoris({Key? key}) : super(key: key);

  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,);
  }
}
