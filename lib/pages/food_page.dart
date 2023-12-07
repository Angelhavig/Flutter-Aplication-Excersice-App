import 'package:app_ejercicio/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class foodPage extends StatefulWidget {
  const foodPage({super.key});

  @override
  State<foodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<foodPage> {
  final Random random = Random();
  final List<String> notifications = [];

  @override
  void initState() {
    super.initState();
    _generateNotifications();
  }

  void _generateNotifications() {
    final numberOfNotifications = random.nextInt(10) + 1; // Genera entre 1 y 10 notificaciones
    for (int i = 0; i < numberOfNotifications; i++) {
      final notificationText = _generateRandomNotification();
      notifications.add(notificationText);
    }
  }

  String _generateRandomNotification() {
    final users = ['@Lucia23', '@CarlosPerez7', '@ElenaSmith', '@JuanGomez22', '@IsabelMendoza', '@Alejandro21', '@MariaLopez9', '@RicardoTorres', '@LauraRodriguez', '@DavidGarcia11', '@SofiaMartinez', '@PedroRamirez', '@AnaSanchez15', '@LuisFernandez', '@NataliaPerez', '@JavierOrtega', '@CarmenMolina', '@AndresGonzalez', '@ClaraHernandez', '@MiguelCruz8', '@MarinaAlvarez', '@RobertoVega', '@PaulaRuiz10', '@GabrielSoto', '@AdrianaDiaz'];
    final actions = ['tweet', 'mensaje', 'seguidores', 'retweet', 'mención'];

    final randomUser = users[random.nextInt(users.length)];
    final randomAction = actions[random.nextInt(actions.length)];

    return 'Nuevo $randomAction de $randomUser';
  }

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
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notificationText = notifications[index];
          return NotificationItem(text: notificationText);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar (
          currentIndex: 1,
      ),backgroundColor: Colors.black,
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String text;

  const NotificationItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 225, 221, 221),fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Hace ${Random().nextInt(60)} minutos",
        style: const TextStyle(color: Color.fromARGB(255, 225, 221, 221),), // Puedes ajustar esto según tus necesidades
      ),
      onTap: () {
        // Acción al tocar la notificación
      },
    );
  }
}
