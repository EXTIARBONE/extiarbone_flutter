import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAction extends StatefulWidget {
  const AddAction({super.key});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Nouvelle Action',
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Date',
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Type d'action",
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Description',
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
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 150,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF5EB09C),
                  ),
                ),
                child: Text(
                  "Ajouter l'action",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
