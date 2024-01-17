import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final String text;
  final List lista;

  CardSwiper({
    Key? key,
    required this.text,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: size.width * 0.37,
                      height: size.height * 0.35,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              lista[index]['url'],
                              width: size.width * 0.37,
                              height: size.height * 0.16,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(lista[index]['name']),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            lista[index]['duration'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
