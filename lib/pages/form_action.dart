import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/api_services.dart';

class AddActionPage extends StatefulWidget {
  @override
  _AddActionPageState createState() => _AddActionPageState();
}

class _AddActionPageState extends State<AddActionPage> {
  late String selectorType = "Voiture diesel";
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
          padding: const EdgeInsets.all(30),
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
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      title: 'Trajet domicile au bureau',
                      description: 'Description du type 1',
                      onTap: () {
                        setState(() {
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
                    if (selectedType.isNotEmpty &&
                        selectedType == "trajet") ...[
                      const SizedBox(height: 30),
                      const Text(
                        'Informations sur l\'action',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      DropdownButtonFormField<String>(
                        value: selectorType,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sélectionner le type de véhicule',
                        ),
                        isExpanded: true,
                        icon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.arrow_circle_down_sharp)),
                        hint: const Text('Sélectionnez un véhicule'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectorType = newValue!;
                          });
                        },
                        items: <String>[
                          "Voiture diesel",
                          "Voiture hybride",
                          "Van diesel",
                          "Voiture au pétrole",
                          "Taxi",
                          "Bus",
                          "Métro",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Distance du trajet (en km)',
                          border: OutlineInputBorder(),
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
                        onPressed: () async {
                          var result = await ApiServices.addAction(
                              distance, selectorType);
                          print(result);
                          result = generateMessageCarbon(result);
                          result =
                              'Vous avez généré $result kg de cO2 avec ce trajet';
                          // ignore: use_build_context_synchronously
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Bilan carbone'),
                              content: Text(result),
                            ),
                          );
                        },
                        child: const Text('Enregistrer'),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          )),
    );
  }

  generateMessageCarbon(String text) {
    RegExp regExp = new RegExp(r"[-+]?\d*\.?\d+");
    Match match = regExp.firstMatch(text)!;
    double number = double.parse(match.group(0)!);
    return number.toStringAsFixed(2);
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
