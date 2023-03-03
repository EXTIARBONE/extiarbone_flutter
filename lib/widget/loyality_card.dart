import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoyaltyCard extends StatelessWidget {
  final String clientName;
  final int loyaltyPoints;

  const LoyaltyCard({
    Key? key,
    required this.clientName,
    required this.loyaltyPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF5EB09C),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 290,
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Carte de fidélité',
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '$clientName',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const SizedBox(height: 8),
              Text(
                'Solde de points : $loyaltyPoints',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
