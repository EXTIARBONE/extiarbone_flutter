import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        SizedBox(height: 70),
        Container(
          child: Text("Nicolas Lacoste"),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: GestureDetector(
              onTap: () {
                // code à exécuter lorsque le conteneur est cliqué
                print("OOOOOo");
              },
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Mes informations"),
                    SizedBox(width: 230),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: GestureDetector(
              onTap: () {
                // code à exécuter lorsque le conteneur est cliqué
                print("OOOOOo");
              },
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Mes recompenses"),
                    SizedBox(width: 220),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              )),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: GestureDetector(
              onTap: () {
                // code à exécuter lorsque le conteneur est cliqué
                print("OOOOOo");
              },
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Mon historique de points"),
                    SizedBox(width: 180),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            )),
            SizedBox(height: 400,),
        ElevatedButton(
          onPressed: () {
            // code à exécuter lorsque le bouton est cliqué
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(200, 255, 255, 255),
              
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
          
          child: Column(
            children: [
              
              Text("Deconnexion",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black
                  
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
