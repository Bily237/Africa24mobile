import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {

  static const url = "10.0.2.2:8000/api/web";

  late Future<List<Map<String, dynamic>>> _future;
  @override
  void initState() {
    super.initState();
    _future = fetch();
  }



  Future<List<Map<String, dynamic>>> fetch() async {
    http.Response response = await http.get(Uri.http('192.168.33.49:8000','/api/web' ));
    if (response.statusCode != 200) return  throw "Unable to retrieve posts.";
    return List<Map<String, dynamic>>.from(json.decode(response.body)['datas']['banners_top']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:  FutureBuilder<List<Map<String, dynamic>>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Text(snapshot.error.toString()),),),);}
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );}
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item['id'].toString()),
                  subtitle: Text(item['path']),
                );
              },
            );
          },
        ),

    );
  }
}
