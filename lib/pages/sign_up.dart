import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/home.dart';
import 'package:flutter_extiarbonne/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_extiarbonne/Services/api_services.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  String _name = '';
  String _surname = '';
  String _mail = '';
  String _password = '';


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 170),
              Text(
                "Créer un compte",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 290,
                height: 470,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Prénom"),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        onChanged: (
                          (String name){
                            _name = name;
                            print(_name);
                          }
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Nom"),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                         onChanged: (
                          (String surname){
                            _surname = surname;
                            print(_surname);
                          }
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Mail"),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                         onChanged: (
                          (String mail){
                            _mail = mail;
                            print(_mail);
                          }
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Mot de passe"),
                        SizedBox(),
                      ],
                    ),
                    
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                         onChanged: (
                          (String password){
                            _password = password;
                            print(_password);
                          }
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                          print("ok"+_name +_surname);
                          signup(_name, _surname, _mail, _password);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF5EB09C),
                        ),
                      ),
                      child: Text(
                        "S'inscrire",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF5EB09C),
                        ),
                      ),
                onPressed: () {
                  /* if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } */
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                 
                },
                child: Text("Se connecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void signup(String name, String surname, String mail, String password) async {
    await ApiServices.signUp(name, surname, mail, password);
    print("compte cree");
  }
