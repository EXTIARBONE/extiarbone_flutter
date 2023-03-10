import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/historique.dart';
import 'package:flutter_extiarbonne/pages/home.dart';
import 'package:flutter_extiarbonne/pages/login.dart';
import 'package:flutter_extiarbonne/widget/loyality_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  void _disconnect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  late String name = '';
  late String surname = '';

  @override
  void initState() {
    super.initState();
    _setPrefs();
  }

  Future<String?> _getPrefsName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    return name;
  }
  Future<String?> _getPrefsSurname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? surname = prefs.getString('surname');
    return surname;
  }

  void _setPrefs() async {
    String? prefsName = await _getPrefsName();
    String? prefsSurname = await _getPrefsSurname();
    setState(() {
      name = prefsName ?? '';
      surname = prefsSurname ?? '';
    });
    print("name : $name");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                child: Text(
                  "$name $surname ",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hostorique()),
                  );
                  // code ?? ex??cuter lorsque le conteneur est cliqu??
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
                  // code ?? ex??cuter lorsque le conteneur est cliqu??
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
                  onTap: () {},
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
                  SizedBox(height:30),
                  Text("Votre consommation carbonne du mois:",
                  style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30,),
          Text(
            "123 ",
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Kilogrammes ??quivalent CO2",
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),),
          const SizedBox(
            height: 60,
          ),
          
          Column(
            children: [
              LoyaltyCard(
                clientName: 'John Doe',
                loyaltyPoints: 150,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () {
              _disconnect();
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
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
