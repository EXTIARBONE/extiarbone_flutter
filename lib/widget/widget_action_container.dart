import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 340,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // couleur de l'ombre
                spreadRadius: 3, // rayon de dispersion
                blurRadius: 7, // flou de l'ombre
                offset: const Offset(
                    0, 3), // position de l'ombre par rapport au container
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Trajet jusqu au bureau',
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(text: '\n+',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: ' 100 points',
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: const Color(0xFF5EB09C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        // ignore: prefer_const_constructors
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFF4B55F),
                          ),
                        ),
                        child: Text("Ajouter",
                        style: GoogleFonts.montserrat(
                            fontSize: 17,
                          ),
                        )),
                    const SizedBox(
                      width: 120,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
