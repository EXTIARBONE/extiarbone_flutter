import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: const [
          SizedBox(height: 10,),
          Center(
            child: Text("BONJOUR NICOLAS"
            )
          ),
          SizedBox(height: 15,),
          Text("Vous avez 0 points")
         ]),
    );
  }
}