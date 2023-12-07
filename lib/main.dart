import 'package:app_ejercicio/pages/add_name.dart';
import 'package:app_ejercicio/pages/chat_page.dart';
import 'package:app_ejercicio/pages/food_page.dart';
import 'package:app_ejercicio/pages/home_page.dart';
import 'package:app_ejercicio/pages/time_page.dart';
import 'package:flutter/material.dart';
//firebase importaciones
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const myaApp());
}

class myaApp extends StatelessWidget {
  const myaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/food': (context) => const foodPage(),
        '/time':(context) => const TimePage(),
        '/chat':(context) => const ChatPage(),
        '/add':(context) => const AddNamePage(),
      },
    );
  }
}




class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    if (index == widget.currentIndex) {
      // No hagas nada si se selecciona la misma página
      return;
    }

    String routeName;

    switch (index) {
      case 0:
        routeName = '/';
        break;
      case 1:
        routeName = '/food';
        break;
      case 2:
        routeName = '/time';
        break;
      case 3:
        routeName = '/chat';
        break;
      case 4:
        routeName = '/add';
        break;
      default:
        routeName = '/';
        break;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 46, 47, 51),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 239, 238, 238),
      unselectedItemColor: const Color.fromARGB(255, 86, 87, 90),
      elevation: 0,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Statistics',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: 'Time',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
    );
  }
}