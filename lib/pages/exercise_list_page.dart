import 'package:healtho_gym/database/database_helper.dart';
import 'package:healtho_gym/database/models/exercise.dart';
import 'package:flutter/material.dart';

import 'exercise_detail_page.dart'; // Import the detailed information page

class ExerciseListPage extends StatefulWidget {
  final String muscleGroup;

  const ExerciseListPage({super.key, required this.muscleGroup});

  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  late Future<List<Exercise>> exercises;

  @override
  void initState() {
    super.initState();
    exercises = DatabaseHelper.getExercisesByMuscleGroup(widget.muscleGroup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.muscleGroup),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
      ),
      body: FutureBuilder<List<Exercise>>(
        future: exercises,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No exercises available for this muscle group.'));
              }
              final exercises = snapshot.data!;
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          // Navigate to the details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseDetailPage(exercise: exercise),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            // Exercise image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.asset(
                                exercise.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/error.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            // Text description
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercise.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(Icons.fitness_center, size: 16, color: Colors.purple),
                                        const SizedBox(width: 5),
                                        Text(
                                          exercise.muscleGroup,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return Container(); // Return an empty container for unhandled states
          }
        },
      ),
    );
  }
}
