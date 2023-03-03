import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/api_services.dart';
import 'package:flutter_extiarbonne/widget/action_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionContainer extends StatelessWidget {
  List<ActionWidget> actionsWidget = [];
  Map urls = {
    "test": 'https://cdn-icons-png.flaticon.com/512/892/892930.png',
    "transport": 'https://cdn-icons-png.flaticon.com/128/706/706195.png',
    "vélo": 'https://cdn-icons-png.flaticon.com/512/3714/3714324.png',
    "bus": 'https://cdn-icons-png.flaticon.com/128/706/706195.png',
  };

  ActionContainer({Key? key, required this.actionsWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: actionsWidget
          .map(
            (actionWidget) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: 340,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: actionWidget.title,
                                  ),
                                  TextSpan(
                                    text: '\n+ ${actionWidget.points} points',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xFF5EB09C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ApiServices.updatePointsUser(
                                        actionWidget.points);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0xFFF4B55F),
                                    ),
                                  ),
                                  child: Text(
                                    "Ajouter",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              urls[actionWidget.url],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
