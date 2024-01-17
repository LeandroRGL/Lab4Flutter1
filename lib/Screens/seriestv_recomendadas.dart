import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesRecomendada extends StatefulWidget {
  TvSeriesRecomendada({super.key});

  @override
  State<TvSeriesRecomendada> createState() => _TvSeriesRecomendadaState();
}

class _TvSeriesRecomendadaState extends State<TvSeriesRecomendada> {
  final List tvseries = [
    {"titulo": "The Witcher", "url": "assets/img_seriestv/The Witcher.jpg"},
    {"titulo": "Stranger Things", "url": "assets/img_seriestv/Stranger Things.jpg"},
    {"titulo": "Breaking Bad", "url": "assets/img_seriestv/Breaking Bad.jpg"},
    {"titulo": "Game of Thrones", "url": "assets/img_seriestv/Game of Thrones.jpg"},
    {"titulo": "Friends", "url": "assets/img_seriestv/Friends.jpg"},
    {"titulo": "The Office", "url": "assets/img_seriestv/The Office.jpg"},
    {"titulo": "Black Mirror", "url": "assets/img_seriestv/Black Mirror.jpg"},
    {"titulo": "The Crown", "url": "assets/img_seriestv/The Crown.jpg"},
    {"titulo": "Sherlock", "url": "assets/img_seriestv/Sherlock.jpg"},
    {"titulo": "Westworld", "url": "assets/img_seriestv/Westworld.jpg"},
    {"titulo": "The Umbrella Academy", "url": "assets/img_seriestv/The Umbrella Academy.jpg"},
    {"titulo": "Peaky Blinders", "url": "assets/img_seriestv/Peaky Blinders.jpg"},
    {"titulo": "Narcos", "url": "assets/img_seriestv/Narcos.jpg"},
    {"titulo": "Mindhunter", "url": "assets/img_seriestv/Mindhunter.jpg"},
    {"titulo": "The Simpsons", "url": "assets/img_seriestv/The Simpsons.jpg"},
    {"titulo": "The Mandalorian", "url": "assets/img_seriestv/The Mandalorian.jpg"},
    {"titulo": "Fargo", "url": "assets/img_seriestv/Fargo.jpg"},
    {"titulo": "Ozark", "url": "assets/img_seriestv/Ozark.jpg"},
    {"titulo": "Money Heist", "url": "assets/img_seriestv/Money Heist.jpg"},
    {"titulo": "Brooklyn Nine-Nine", "url": "assets/img_seriestv/Brooklyn Nine-Nine.jpg"}
  ];

  List seriestvPuntuadas = [];

  var indice = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recomendacion de Series"),
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (indice < tvseries.length)
              Image.asset(tvseries[indice]["url"], width: size.width * 0.98, height: size.height * 0.7)
            else
              Text("[fin de la lista]")
          ]),
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
                        title: Text("Series que calificaste"),
                        content: Column(children: [
                          for (var tvseries in seriestvPuntuadas)
                            Column(
                              children: [
                                Text("Título: ${tvseries['titulo']}"),
                                Text("Puntuación: ${tvseries['puntuacion'].toString()}"),
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
                        title: Text("Serie para puntuar"),
                        content: Column(
                          children: [
                            Text("Puntua la serie"),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                puntuacion = rating;
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                seriestvPuntuadas.add({"titulo": tvseries[indice]["titulo"], "puntuacion": puntuacion});
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
                Icons.star,
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
