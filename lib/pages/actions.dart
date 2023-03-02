import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/add_action_bottom_sheet.dart';
import 'package:flutter_extiarbonne/widget/action_widget.dart';
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
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(
            child: Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Bonjour Théo",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                "Vous avez ",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "0 points",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: const Color(0xFF5EB09C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF5EB09C),
                  ),
                ),
                child: Text(
                  "Ajouter une action",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                "Actions Quotidiennes :",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ActionContainer(
                    actionsWidget: [
                      ActionWidget(
                          title: "Transport en commun",
                          points: 12,
                          url: "transport"),
                      ActionWidget(
                          title: "Transport en commun",
                          points: 12,
                          url: "test"),
                      ActionWidget(
                          title: "Transport en commun",
                          points: 12,
                          url: "vélo"),
                      ActionWidget(
                          title: "Transport en commun",
                          points: 12,
                          url: "transport")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return AddAction();
    },
  );
}
