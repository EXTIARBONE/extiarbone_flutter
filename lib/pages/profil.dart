import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "Nicolas Lacoste",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: GestureDetector(
                onTap: () {
                  // code à exécuter lorsque le conteneur est cliqué
                  print("OOOOOo");
                },
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 10),
                      Text("Mes informations"),
                      SizedBox(width: 235),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: GestureDetector(
                onTap: () {
                  // code à exécuter lorsque le conteneur est cliqué
                  print("OOOOOo");
                },
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 10),
                      Text("Mes recompenses"),
                      SizedBox(width: 225),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: GestureDetector(
                  onTap: () {
                    // code à exécuter lorsque le conteneur est cliqué
                    print("OOOOOo");
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Mon historique de points"),
                        SizedBox(width: 185),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ))),
          const SizedBox(
            height: 400,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 255, 255, 255),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Deconnexion",
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
