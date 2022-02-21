// @dart=2.9



import 'package:africa24/Screens/home.dart';
import 'package:africa24/api.dart';
import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Africa24',
        theme: ThemeData(
          primaryColor: KPrimarycolor,
        ),
        home: const Homecreen());
  }
}
