import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/widget/widget_action_container.dart';
import 'package:google_fonts/google_fonts.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          const Center(
            child: Text(
              "BONJOUR NICOLAS",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Vous avez 0 points"),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("OK");
                },
                child: const Text("Ajouter une action"),
              ),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
          const Text("Actions Quotidiennes"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ActionContainer(),
                  ActionContainer(),
                  ActionContainer(),
                  ActionContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
