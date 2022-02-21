import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';

class ContaiCategories extends StatelessWidget {
  const ContaiCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 8, right: 5),
      child: Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                image: AssetImage(
                  "assets/images/image1.jpg",
                ))),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("Politique",
                  style: TextStyle(
                      color: KTextcolos,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
