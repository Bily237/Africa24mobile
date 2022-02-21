import 'package:flutter/material.dart';

class FilDactualite extends StatefulWidget {
  final String actu;
  const FilDactualite({Key? key, required this.actu}) : super(key: key);

  @override
  _FilDactualiteState createState() => _FilDactualiteState();
}

class _FilDactualiteState extends State<FilDactualite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fil d'actualité "),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      widget.actu,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                        ),
                        Text("écrit par africa 24",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.schedule,
                          color: Colors.grey,
                          size: 10,
                        ),
                        Text("11/09/2021  à 17h02",
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
