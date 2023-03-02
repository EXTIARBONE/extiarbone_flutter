import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/home.dart';
import 'package:flutter_extiarbonne/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
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
                height: 400,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        Text("Pseudo"),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
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