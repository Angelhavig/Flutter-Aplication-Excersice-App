import 'package:app_ejercicio/main.dart';
import 'package:app_ejercicio/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 46, 47, 51),
        title: Text(
          'Workout TC ▼',
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      body: const Column(
        children: [
          RowUsuarios(),
           Expanded(
            child: ListaUsuarios(), // Usa Expanded para que ocupe todo el espacio
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}

class ListaUsuarios extends StatelessWidget {
  const ListaUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: const Color.fromARGB(255, 35,36,37),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> data = snapshot.data ?? [];
            return ScoreList(scores: data);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


class RowUsuarios extends StatelessWidget {
  const RowUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 35, bottom: 10),
      height: 150,
      color: const Color.fromARGB(255, 67, 67, 66),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: getPodio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> data = snapshot.data ?? [];
            return ListView(
              scrollDirection: Axis.horizontal, // Desplázate horizontalmente
              children: List.generate(data.length, (index) {
                double size = 35; // Tamaño por defecto
                Color color = const Color.fromARGB(255, 254, 253, 253);
                int rank = index + 1;
                if (index == 0) {
                  size = 50;
                  color = Colors.yellow[700]!;
                } else if (index == 1) {
                  size = 80;
                  color = Colors.grey[300]!;
                } else if (index == 2) {
                  size = 50;
                  color = Colors.orange[300]!;
                }

                final name = data[index]['Nombre'];
                final points = data[index]['Puntuacion'];

                return Container(
                  width: MediaQuery.of(context).size.width * 0.3, // Ajusta el ancho
                  margin: const EdgeInsets.all(0), // Espacio entre los elementos
                  child: Align(
                    alignment: Alignment.center, // Centra hacia la izquierda
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          //margin: EdgeInsets.only(top: size * 0.1),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: size / 2,
                                // Agrega la imagen estática aquí
                                backgroundImage: const AssetImage('assets/preview_0.jpg'),
                              ),
                              Positioned(
                                top: (size * 0.7),
                                child: Icon(
                                  Icons.star,
                                  color: color,
                                  size: size * 0.5,
                                ),
                              ),
                              Positioned(
                                top: size * 0.85,
                                child: Text(
                                  '$rank',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size * 0.2,
                                    color: const Color.fromARGB(255, 87, 87, 87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16, // Ajusta el tamaño del texto según sea necesario
                            color: Colors.white, // Color del texto
                          ),
                        ),
                        Text(
                          'Puntos: $points', // Ajusta el formato según tus necesidades
                          style: const TextStyle(
                            fontSize: 14, // Ajusta el tamaño del texto según sea necesario
                            color: Color.fromARGB(255, 110, 102, 102), // Color del texto
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}



class ScoreList extends StatelessWidget {
  final List<Map<String, dynamic>> scores;

  ScoreList({required this.scores});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scores.length,
      itemBuilder: (context, index) {
        final name = scores[index]['Nombre'];
        final position = index + 1;
        final points = scores[index]['Puntuacion'];

        return ScoreListItem(
          position: position,
          name: name,
          points: points,
        );
      },
    );
  }
}

class ScoreListItem extends StatelessWidget {
  final int position;
  final String? name;
  final int? points;

  ScoreListItem({required this.position, this.name, this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15,),
      padding: const EdgeInsets.only(left: 10, right: 10,),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(

            color: Colors.grey, // Color de la línea
            width: 2.0 * 0.3, // Grosor de la línea
          ),
        ),
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                position.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(width: 40),
              const Icon(
                Icons.account_circle,
                color: Colors.white60,
                size: 36,
              ),
              const SizedBox(width: 10),
              Text(
                name ?? "N/A",
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 247, 247, 247),
                ),
              ),
            ],
          ),
          Text(
            points?.toString() ?? "N/A",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


