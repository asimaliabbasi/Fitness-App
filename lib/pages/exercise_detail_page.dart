import 'package:flutter/material.dart';
import 'package:healtho_gym/database/models/exercise.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.black12, // Placeholder for the video
                alignment: Alignment.center,
                child: const Text(
                  'Video demonstrating the technique',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 16.0),

              // Muscle group
              Text(
                'Muscle Group:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                exercise.muscleGroup,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16.0),

              // Description
              Text(
                'Description:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                exercise.description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
