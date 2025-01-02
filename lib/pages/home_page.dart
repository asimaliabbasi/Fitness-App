<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healtho_gym/pages/exercise_page.dart';
import 'package:healtho_gym/pages/proofile_page.dart';
import 'trainings_page.dart';

=======
import 'package:healtho_gym/pages/exercise_page.dart';
import 'package:healtho_gym/pages/proofile_page.dart';
import 'package:flutter/material.dart';
import 'trainings_page.dart';
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

<<<<<<< HEAD
=======
  // List of titles for the AppBar
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
  final List<String> _titles = [
    'Home',
    'Trainings',
    'Exercises',
    'Profile',
  ];

  final List<Widget> _pages = [
<<<<<<< HEAD
    const HomeScreen(),
    const TrainingsPage(),
    const ExercisesPage(),
    const ProfilePage(),
=======
    const Center(child: Text('Home')), // Home page
    const TrainingsPage(), // Trainings page
    const ExercisesPage(), // Exercises page
    const ProfilePage(), // Profile page
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        automaticallyImplyLeading: false, // This removes the back arrow
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            _titles[_currentIndex],
            style: const TextStyle(color: Colors.yellow),
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
=======
          title: Center(
            child: Text(_titles[_currentIndex]),
          )),
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
<<<<<<< HEAD
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
=======
        selectedItemColor: Colors.purple, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Trainings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Exercises'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calendar Widget
          Text(
            "Today's Schedule",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Calendar ",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Activity Chart
          Text(
            "Activity Progress",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActivityChart(),
            ),
          ),
          SizedBox(height: 20),

          // Colorful Schedule Cards
          Text(
            "Upcoming Workouts",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              WorkoutCard(
                  title: "Morning Yoga",
                  time: "6:30 AM",
                  color: Colors.yellow.shade100,),
              WorkoutCard(
                  title: "Cardio Blast",
                  time: "10:00 AM",
                  color: Colors.green.shade100,),
              WorkoutCard(
                  title: "Strength Training",
                  time: "5:00 PM",
                  color:  Colors.blue.shade100),
            ],
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String time;
  final Color color;

  const WorkoutCard(
      {required this.title, required this.time, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ActivityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                );
                switch (value.toInt()) {
                  case 0:
                    return Text('Mon', style: style);
                  case 1:
                    return Text('Tue', style: style);
                  case 2:
                    return Text('Wed', style: style);
                  case 3:
                    return Text('Thu', style: style);
                  case 4:
                    return Text('Fri', style: style);
                  case 5:
                    return Text('Sat', style: style);
                  case 6:
                    return Text('Sun', style: style);
                  default:
                    return const Text('');
                }
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 2),
              FlSpot(1, 3),
              FlSpot(2, 1),
              FlSpot(3, 4),
              FlSpot(4, 3.5),
              FlSpot(5, 5),
              FlSpot(6, 4.2),
            ],
            isCurved: true,
            color: Colors.black,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.yellow.withOpacity(0.5),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
=======
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
