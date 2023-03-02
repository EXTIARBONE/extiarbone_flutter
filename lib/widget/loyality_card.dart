import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Carte de fidélité',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '$clientName',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Solde de points : $loyaltyPoints',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
