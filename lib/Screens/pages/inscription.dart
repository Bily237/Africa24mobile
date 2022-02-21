import 'package:africa24/Screens/home.dart';
import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  late double height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [KPrimarycolor, Kbuttoncolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0,top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: width*.8,
                    )),
                Expanded(
                  flex: 6,
                  child: Card(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    color: KTextcolos,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5, left: 20, right: 20),
                      child: ListView(
                        primary: false,
                        children: [
                          const Center(
                            child: Text("Inscrivez-vous",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Center(
                            child: Text("Veillez remplir le formulaire",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          ),
                          const TextField(
                              decoration: InputDecoration(
                                labelText: 'Nom',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.user,
                                  size: 17,
                                ),
                              )),
                          const TextField(
                              decoration: InputDecoration(
                                labelText: 'Prénom',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.userAlt,
                                  size: 17,
                                ),
                              )),
                          const TextField(
                              decoration: InputDecoration(
                                labelText: 'Adresse E-mail',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 17,
                                ),
                              )),
                          const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  size: 17,
                                ),
                              )),
                          const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: ' confirmer le mot de passe',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  size: 17,
                                ),
                              )),
                          const Padding(
                            padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, top: 10),
                            child: Text(
                              "vous avez déjà un compte ?",
                              style: TextStyle(
                                color: KPrimarycolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [green_colors, green_colors],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.center),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    "Créer",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Homecreen(),
                                )),
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.grey, Colors.grey],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.center),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 3, bottom: 3),
                                  child: Text(
                                    "Annuler",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                FontAwesomeIcons.twitterSquare,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                FontAwesomeIcons.googlePlus,
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
