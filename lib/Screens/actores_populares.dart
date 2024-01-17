import 'package:app_laboflutter/Widget/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ActoresPopulares extends StatefulWidget {
  ActoresPopulares({super.key});

  @override
  State<ActoresPopulares> createState() => _ActoresPopularesState();
}

class _ActoresPopularesState extends State<ActoresPopulares> {
  final List actores = [
    {"nombre": "Jeremy Piven", "url": "assets/img_actores/Jeremy Piven.jpg"},
    {"nombre": "Farrah Mackenzie", "url": "assets/img_actores/Farrah Mackenzie.jpg"},
    {"nombre": "Josh hutcherson", "url": "assets/img_actores/Josh hutcherson.jpg"},
    {"nombre": "Aya Asahina", "url": "assets/img_actores/Aya Asahina.jpg"},
    {"nombre": "Sydney Sweeney", "url": "assets/img_actores/Sydney Sweeney.jpg"},
    {"nombre": "Timothée Chalamet", "url": "assets/img_actores/Timothée Chalamet.jpg"},
    {"nombre": "Ana de Armas", "url": "assets/img_actores/Ana de Armas.jpg"},
    {"nombre": "Song Kang", "url": "assets/img_actores/Song Kang.jpg"},
    {"nombre": "Tom Hanks", "url": "assets/img_actores/Tom Hanks.jpg"},
    {"nombre": "Nicolas Cage", "url": "assets/img_actores/Nicolas Cage.jpg"},
    {"nombre": "Madeleine Yuna Voyles", "url": "assets/img_actores/Madeleine Yuna Voyles.jpg"},
    {"nombre": "Ian Mc Shane", "url": "assets/img_actores/Ian Mc Shane.jpg"},
    {"nombre": "Emma Myers", "url": "assets/img_actores/Emma Myers.jpg"},
    {"nombre": "Myha'la Herrold", "url": "assets/img_actores/Myha'la Herrold.jpg"},
  ];

  List actoresPuntuados = [];

  var indice = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Actores Populares"),
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (indice < actores.length)
                Column(
                  children: [
                    Image.asset(
                      actores[indice]["url"],
                      width: size.width * 0.98,
                      height: size.height * 0.5,
                    ),
                    Text(
                      actores[indice]["nombre"],
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              else
                Text("[fin de la lista]"),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButtonAnimator:
        floatingActionButton: Container(
          width: 250,
          decoration: BoxDecoration(color: Color.fromARGB(255, 133, 174, 240), borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              heroTag: "fab_history",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Actores que calificaste"),
                        content: Column(children: [
                          for (var actores in actoresPuntuados)
                            Column(
                              children: [
                                Text("Actor ${actores['nombre']}"),
                                Text("Puntuación: ${actores['puntuacion'].toString()}"),
                              ],
                            )
                        ]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    });
              },
              backgroundColor: Color.fromARGB(255, 170, 6, 6),
              child: const Icon(Icons.history),
            ),
            FloatingActionButton(
              heroTag: "fab_puntuar",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      double puntuacion = 0;
                      return AlertDialog(
                        title: Text("Calificá al actor"),
                        content: Column(children: [
                          Text("1 a 5 según la carita"),
                          RatingBar.builder(
                            initialRating: 3,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              switch (index) {
                                case 0:
                                  return Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    color: Colors.red,
                                  );
                                case 1:
                                  return Icon(
                                    Icons.sentiment_dissatisfied,
                                    color: Colors.redAccent,
                                  );
                                case 2:
                                  return Icon(
                                    Icons.sentiment_neutral,
                                    color: Colors.amber,
                                  );
                                case 3:
                                  return Icon(
                                    Icons.sentiment_satisfied,
                                    color: Colors.lightGreen,
                                  );
                                case 4:
                                  return Icon(
                                    Icons.sentiment_very_satisfied,
                                    color: Colors.green,
                                  );
                              }
                              return Icon(Icons.sentiment_dissatisfied, color: Colors.redAccent);
                            },
                            onRatingUpdate: (rating) {
                              puntuacion = rating;
                            },
                          ),
                        ]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                actoresPuntuados.add({"nombre": actores[indice]["nombre"], "puntuacion": puntuacion});
                                indice = indice + 1;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    });
              },
              backgroundColor: Color.fromARGB(255, 39, 123, 201),
              child: const Icon(
                Icons.sentiment_satisfied_outlined,
                color: Colors.amber,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab_next",
              onPressed: () {
                setState(() {
                  indice = indice + 1;
                });
              },
              child: const Icon(Icons.arrow_forward_outlined),
            )
          ]),
        ));
  }
}
