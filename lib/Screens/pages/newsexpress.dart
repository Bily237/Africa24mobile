import 'package:africa24/colors.dart';
import 'package:africa24/containeur/newsexpress.dart';
import 'package:africa24/http_request.dart';
import 'package:africa24/model/newsexpress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsEpresssPage extends StatefulWidget {
  const NewsEpresssPage({Key? key}) : super(key: key);

  @override
  _NewsEpresssPageState createState() => _NewsEpresssPageState();
}

class _NewsEpresssPageState extends State<NewsEpresssPage> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.getnewsexpress(),
        builder: (context, AsyncSnapshot<List<Newsexpress>> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
                    'verifier votre connexion internet ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Newsexpress> news = snapshot.data!;
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (_, index) {
                final formath = DateFormat('HH:mm ');
                final formatdate = DateFormat('dd-MM-yyyy');

                if (index == 0) {
                  return Column(
                    children: [
                      NewsExpress(
                        resume: news[index].body,
                        title: news[index].title + '$index',
                        date: formatdate
                            .format(DateTime.parse(news[index].date))
                            .toString(),
                        time: formath
                            .format(DateTime.parse(news[index].date))
                            .toString(),
                      ),
                      const Divider(
                        color: KPrimarycolor,
                        height: 10,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      NewsExpress(
                        resume: news[index].body,
                        title: news[index].title + '$index',
                        date: formatdate
                            .format(DateTime.parse(news[index].date))
                            .toString(),
                        time: formath
                            .format(DateTime.parse(news[index].date))
                            .toString(),
                      ),
                      const Divider(
                        color: KPrimarycolor,
                        height: 10,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                }
              },
            );
          } else {
            return Container(
              color: Colors.white,
            );
          }
        });
  }
}
