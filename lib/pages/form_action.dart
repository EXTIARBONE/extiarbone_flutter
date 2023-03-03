import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/api_services.dart';

class AddActionPage extends StatefulWidget {
  @override
  _AddActionPageState createState() => _AddActionPageState();
}

class _AddActionPageState extends State<AddActionPage> {
  late String selectorType = "";
  late String selectedType = "";
  late String title = "";
  late num distance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajout d\'une action',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5EB09C),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Quel type d\'actions ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      title: 'Trajet domicile au bureau',
                      description: 'Description du type 1',
                      onTap: () {
                        setState(() {
                          // Enregistrer le choix de l'utilisateur et afficher la partie suivante
                          selectedType = 'trajet';
                        });
                      },
                      selected: selectedType == 'trajet',
                    ),
                    _buildCard(
                      title: 'Évènements',
                      description: 'After work ou soirée chill',
                      onTap: () {
                        setState(() {
                          // Enregistrer le choix de l'utilisateur et afficher la partie suivante
                          selectedType = 'event';
                        });
                      },
                      selected: selectedType == 'event',
                    ),
                    _buildCard(
                      title: 'Autre',
                      description: 'Description du type 3',
                      onTap: () {
                        setState(() {
                          selectedType = 'Type 3';
                        });
                      },
                      selected: selectedType == 'Type 3',
                    ),
                  ],
                ),
              ),
              if (selectedType.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Informations sur l\'action',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                DropdownButton<String>(
                  value: selectorType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectorType = newValue!;
                    });
                  },
                  items: <String>[
                    '',
                    'Type 1',
                    'Type 2',
                    'Type 3',
                    'MediumDieselCar',
                    'MediumHybridCar',
                    'MediumDieselVan',
                    'MediumPetrolCar',
                    'Taxi',
                    'ClassicBus',
                    'Subway',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Distance du trajet (en km)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    num? distanceValue = num.tryParse(value);
                    if (distanceValue != null) {
                      distance = distanceValue;
                    }
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF5EB09C),
                    ),
                  ),
                  onPressed: () {
                    ApiServices.addAction(distance, selectorType);
                    print(selectorType);
                    print(selectedType);
                    print(distance);
                    //Navigator.pop(context);
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ],
          )),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return Card(
      color: selected ? Color(0xFF5EB09C) : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : null,
          ),
        ),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
