import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Coloca aquí tus páginas correspondientes
    // Ejemplo: HomePage(), FoodPage(), TimePage(), ChatPage(), AddPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacementNamed(context, '/${_getPageRouteName(index)}');
  }

  String _getPageRouteName(int index) {
    switch (index) {
      case 0:
        return '';
      case 1:
        return 'food';
      case 2:
        return 'time';
      case 3:
        return 'chat';
      case 4:
        return 'add';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App Title'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 46, 47, 51),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 154, 39, 39),
        unselectedItemColor: const Color.fromARGB(255, 86, 87, 90),
        elevation: 0,
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Food',
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
