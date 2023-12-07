import 'package:flutter/material.dart';
import 'package:app_ejercicio/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({Key? key}) : super(key: key);

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
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
      body: ProfilePage(), // Aquí se coloca el contenido de ProfilePage.
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 4,
      ),backgroundColor: Colors.black,
    );
  }
}
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/box.jpg'),
            ),
            const SizedBox(height: 15),
            const Text(
              'Lucy Heaton',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Intermediate Athlete',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoColumn('Ranking', '1', FontAwesomeIcons.trophy),
                _buildInfoColumn('Points', '3,214', null),
                _buildInfoColumn('Goal streaks', '24', null),
              ],
            ),
            const SizedBox(height: 40),
            ProfileCard(),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 18),
            AspectRatio(
              aspectRatio: 1.7,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 2.7),
                        const FlSpot(1, 1.6),
                        const FlSpot(2, 2.5),
                        const FlSpot(3, 2.3),
                        const FlSpot(4, 2.5),
                        const FlSpot(5, 2.2),
                        const FlSpot(6, 2.4),
                      ],
                      isCurved: true,
                      colors: [Colors.white],
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        colors: [
                          Colors.white.withOpacity(0.3),
                        ],
                        show: true,
                      ),
                    ),
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 2.8),
                        const FlSpot(1, 1.7),
                        const FlSpot(2, 2.6),
                        const FlSpot(3, 2.6),
                        const FlSpot(4, 1.5),
                      ],
                      isCurved: false,
                      colors: [const Color(0xFF26BDFD)],
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            StepsDesign(),
          ],
        ),
      ),
    );
  }

Row _buildInfoColumn(String title, String value, IconData? icon) {
  return Row(
    children: [
      if (icon != null) Icon(icon, color: Colors.yellow, size: 50), const SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    ],
  );
}


}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/fitn.jpg'),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sarah Stratford',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Personal Coach',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildInfoColumn('241', 'Students'),
                    const SizedBox(width: 30),
                    _buildInfoColumn('24', 'Champions'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildInfoColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

class StepsDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Steps',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  '11,476',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 59,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem('Kilometers', '5.8'),
              _buildInfoItem('Calories', '320'),
              _buildInfoItem('Points', '73'),
            ],
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Exercises Done',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ExerciseCard(),
        ],
      ),
    );
  }

  Column _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ExerciseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: const Text(
              '92',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Image.asset('assets/ejer.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cobra Lift',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'with Sarah Stratford',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}