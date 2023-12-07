import 'dart:math';

import 'package:app_ejercicio/main.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<ChatPage> {
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
      body: ChatList(),
      bottomNavigationBar: const CustomBottomNavigationBar (
          currentIndex: 3,
      ),backgroundColor: Colors.black,
    );
  }
}




class ChatList extends StatelessWidget {
 final Random random = Random();
  final List<String> contactNames = ['Lucia','CarlosPerez','ElenaSmith','IsabelMendoza','Alejandro','MariaLopez','RicardoTorres','LauraRodriguez','SofiaMartinez','PedroRamirez','AnaSanchez','LuisFernandez','NataliaPerez','JavierOrtega','CarmenMolina','AndresGonzalez','ClaraHernandez','MarinaAlvarez','RobertoVega','GabrielSoto','AdrianaDiaz'];
  final List<String> usedContactNames = [];

  ChatList({super.key});
  
  @override
  Widget build(BuildContext context) {
    final itemCount = random.nextInt(11) + 2;
    return ListView.builder(
      itemCount: itemCount, // Cambia esto por la cantidad de conversaciones que desees mostrar
      itemBuilder: (context, index) {
        String contactName;
        do {
          contactName = contactNames[random.nextInt(contactNames.length)];
        } while (usedContactNames.contains(contactName));
        usedContactNames.add(contactName);

        const lastMessage = 'Nuevo Mensaje';
        final hour = '${random.nextInt(12)}:${random.nextInt(60)} ${random.nextInt(2) == 0 ? "AM" : "PM"}';

        return ChatItem(
          contactName: contactName,
          lastMessage: lastMessage,
          time: hour,
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final String contactName;
  final String lastMessage;
  final String time;

  const ChatItem({super.key, 
    required this.contactName,
    required this.lastMessage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25.0,
        // Aquí puedes establecer la imagen del perfil del contacto
        // Image.network('URL_DE_LA_IMAGEN') o Image.asset('RUTA_DE_LA_IMAGEN')
      ),
      title: Text(
        contactName,
        style: const TextStyle(color: Color.fromARGB(255, 225, 221, 221),fontWeight: FontWeight.bold),
        
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Color.fromARGB(255, 225, 221, 221)),
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Color.fromARGB(255, 225, 221, 221)),
      ),
    );
  }
}