import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Hostorique extends StatefulWidget {
  const Hostorique({super.key});

  @override
  State<Hostorique> createState() => _HostoriqueState();
}

class _HostoriqueState extends State<Hostorique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("MON HISTORIQUE"),
            SizedBox(
              height: 50,
            ),
            Text("Vous avez fait action 1"),
            SizedBox(
              height: 50,
            ),
            Text("Vous avez fait action 2"),
            SizedBox(
              height: 50,
            ),
            Text("Vous avez fait action 3"),
          ],
        ),
      ),
    );
  }
}
