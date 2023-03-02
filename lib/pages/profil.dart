import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
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
                  SizedBox(width: 340),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )

          ),
          Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
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
                  SizedBox(width: 340),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
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
                  SizedBox(width: 340),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )
        ),
        ],
      )
      
    );
  }
}
