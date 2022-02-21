import 'dart:convert';
import 'package:africa24/address_server.dart';

import 'package:africa24/model/articles.dart';
import 'package:africa24/model/banners.dart';

import 'package:africa24/model/newsexpress.dart';



import 'package:http/http.dart' as http;


import 'model/actualite.dart';


class HttpService {
  var data=[];
  List<Articles> results=[];
  List<Category> menu=[];
  // Future<List<Map<String, dynamic>>> GetUnes() async {
  //  http.Response _res = await http.get(Uri.http('192.168.33.49:8000','/api/mobile' ));
  ////  if (_res.statusCode != 200) return  throw "Unable to retrieve posts.";
  // return List<Map<String, dynamic>>.from(json.decode(_res.body)['unes']);
  //}
  Future<List<Articles>> getPosts() async {
    var res = await http
        .get(Uri.http(urlpost,'/api/articles'));
    try {
      if (res.statusCode == 200) {
        data=json.decode(res.body);
        results = data.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw "api error.";
      }
    }on Exception catch(e){
      throw "error:$e";
    }
    return results;
  }
  Future<List<Articles>> Getunes() async {
    var res = await http
        .get(Uri.http(urlpost,'/api/articles/unes'));
    try {
      if (res.statusCode == 200) {
        data=json.decode(res.body);
        results = data.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw "api error.";
      }
    }on Exception catch(e){
      throw "error:$e";
    }
    return results;
  }


  Future<List<Articles>> getCategory(category) async {
    var res = await http
        .get(Uri.http(urlpost,'/api/category/$category'));
    try {
      if (res.statusCode == 200) {
        data=json.decode(res.body);
        results = data.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw "api error.";
      }
    }on Exception catch(e){
      throw "error:$e";
    }
    return results;
  }

  Future<List<Category>> getMenu() async {
    var res = await http
        .get(Uri.http(urlpost,'/api/menus'));
    try {
      if (res.statusCode == 200) {
        data=json.decode(res.body);
        menu = data.map((e) => Category.fromJson(e)).toList();
      } else {
        throw "api error.";
      }
    }on Exception catch(e){
      throw "error:$e";
    }
    return menu;
  }


  Future<List<Category>> getProgramme() async {
    var res = await http
        .get(Uri.http(urlpost,'api/programmes'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Category> posts =
      body.map((dynamic item) => Category.fromJson(item)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }


  Future<List<Category>> getRegions() async {
    var res = await http
        .get(Uri.http(urlpost,'api/regions'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Category> posts =
      body.map((dynamic item) => Category.fromJson(item)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }




  Future<List<Actualite>> getscrolls() async {
    var scroll = await http
        .get(Uri.http(urlpost, '/api/scrolls'));
    if (scroll.statusCode == 200) {
      List<dynamic> body = jsonDecode(scroll.body);

      List<Actualite> actu =
      body.map((dynamic item) => Actualite.fromJson(item)).toList();

      return actu;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Banners>> getbanners() async {
    var scroll = await http
        .get(Uri.http(urlpost, '/api/baners'));
    if (scroll.statusCode == 200) {
      List<dynamic> body = jsonDecode(scroll.body);

      List<Banners> actu =
      body.map((dynamic item) => Banners.fromJson(item)).toList();

      return actu;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Newsexpress>> getnewsexpress() async {
    var newsexpress = await http
        .get(Uri.http(urlpost, '/api/newsexpresses'));
    if (newsexpress.statusCode == 200) {
      List<dynamic> body = jsonDecode(newsexpress.body);

      List<Newsexpress> news =
      body.map((dynamic item) => Newsexpress.fromJson(item)).toList();

      return news;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}


class ArticlesList {
  var data = [];
  List<Articles> results = [];
  List<Articles> result = [];

  Future<List<Articles>> getArticleList({String? query}) async {
    try {
      var response = await http
          .get(Uri.http(urlpost, '/api/articles'));
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => Articles.fromJson(e)).toList();
        if (query!= null){

          result = results.where(
                  (element) => element.category.title.toLowerCase().contains((query.toLowerCase()))
          ).toList();

        }
      } else {
        print("erreur API");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return result;
  }
}

