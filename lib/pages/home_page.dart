import 'package:healtho_gym/pages/exercise_page.dart';
import 'package:healtho_gym/pages/proofile_page.dart';
import 'package:flutter/material.dart';
import 'trainings_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of titles for the AppBar
  final List<String> _titles = [
    'Home',
    'Trainings',
    'Exercises',
    'Profile',
  ];

  final List<Widget> _pages = [
    const Center(child: Text('Home')), // Home page
    const TrainingsPage(), // Trainings page
    const ExercisesPage(), // Exercises page
    const ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(_titles[_currentIndex]),
          )),
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.purple, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
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
