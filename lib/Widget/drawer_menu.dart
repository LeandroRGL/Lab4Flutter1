import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Inicio', 'subtitle': 'Menú principal'},
    {'route': 'favorita', 'title': 'Películas', 'subtitle': 'Populares'},
    {'route': 'recomendada', 'title': 'Películas', 'subtitle': 'Recomendadas'},
    {'route': 'favorita_TvSeries', 'title': 'Series TV', 'subtitle': 'Populares'},
    {'route': 'recomendada_TvSeries', 'title': 'Series TV', 'subtitle': 'TV Recomendadas'},
    {'route': 'populares_Actores', 'title': 'Actores', 'subtitle': 'Populares'},
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(24, 70, 38, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeaderAlternative(),
          ...ListTile.divideTiles(
              color: Colors.amber,
              context: context,
              tiles: _menuItems
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        dense: true,
                        minLeadingWidth: 25,
                        iconColor: Colors.blueGrey,
                        title: Text(item['title']!,
                            style: const TextStyle(fontFamily: 'FuzzyBubbles', fontSize: 16, color: Colors.white)),
                        subtitle: Text(item['subtitle'] ?? '',
                            style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12, color: Colors.white)),
                        leading: const Icon(Icons.video_camera_front_sharp),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, item['route']!);
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatelessWidget {
  const _DrawerHeaderAlternative({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/img_logo/logo.png",
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
