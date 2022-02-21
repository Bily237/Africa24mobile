import 'package:africa24/Screens/pages/inscription.dart';
import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
late double height,width;

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height ,
          width: width ,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [KPrimarycolor, Kbuttoncolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0,top: 50),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: width *.80,
                    )),
                Expanded(
                  flex: 4,
                  child: Card(
                    margin: const EdgeInsets.only(left:15, right: 15),
                    color: KTextcolos,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          const Text("Connectez-vous",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold)),
                          const Text("Veillez-vous connecter à votre compte  ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Adresse E-mail',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.envelope,
                                    size: 17,
                                  ),
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Mot de passe',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.key,
                                    size: 17,
                                  ),
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(150, 20, 10, 10),
                            child: Text(
                              "Mot de passe oublié ?",
                              style: TextStyle(
                                color: KPrimarycolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [KPrimarycolor, Kbuttoncolor],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.center),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Se Connecter",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Inscription(),
                                )),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 60.0, right: 60.0),
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
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Créer un nouveau compte",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Row(
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
                          )
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
