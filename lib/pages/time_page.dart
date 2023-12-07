import 'dart:async';

import 'package:app_ejercicio/main.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  int seconds = 0;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  void startStopwatch() {
    setState(() {
      isRunning = true;
    });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      } else {
        setState(() {
          seconds++;
        });
      }
    });
  }

  void stopStopwatch() {
    setState(() {
      isRunning = false;
    });
  }

  void resetStopwatch() {
    setState(() {
      seconds = 0;
    });
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
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _formattedTime(seconds),
                style: TextStyle(fontSize: 72, color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: isRunning ? stopStopwatch : startStopwatch,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(120, 50),
                    ),
                    child: Text(isRunning ? "Detener" : "Iniciar"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetStopwatch,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize: Size(120, 50),
                    ),
                    child: const Text("Reiniciar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 2,
      ),
    );
  }

  String _formattedTime(int timeInSeconds) {
    final hours = (timeInSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((timeInSeconds ~/ 60) % 60).toString().padLeft(2, '0');
    final seconds = (timeInSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}