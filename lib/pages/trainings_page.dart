<<<<<<< HEAD
import 'dart:async';

=======
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
import 'package:flutter/material.dart';

class TrainingsPage extends StatelessWidget {
  const TrainingsPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final List<TrainingSection> trainingSections = [
      TrainingSection(
        title: 'Warm-Up',
        description: '5 minutes of light stretching and jogging in place.',
        durationInMinutes: 5,
        color: Colors.blue.shade100,
      ),
      TrainingSection(
        title: 'Push-Ups',
        description: 'Perform as many push-ups as you can in 3 minutes.',
        durationInMinutes: 3,
        color: Colors.green.shade100,
      ),
      TrainingSection(
        title: 'Plank',
        description: 'Hold a plank position for 2 minutes.',
        durationInMinutes: 2,
        color: Colors.yellow.shade100,
      ),
      TrainingSection(
        title: 'Squats',
        description: 'Do 20 squats followed by a 2-minute rest.',
        durationInMinutes: 4,
        color: Colors.orange.shade100,
      ),
      TrainingSection(
        title: 'Lunges',
        description: 'Perform alternating lunges for 3 minutes.',
        durationInMinutes: 3,
        color: Colors.pink.shade100,
      ),
      TrainingSection(
        title: 'Cool Down',
        description: 'Stretch and breathe deeply for 5 minutes.',
        durationInMinutes: 5,
        color: Colors.purple.shade100,
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: trainingSections.length,
        itemBuilder: (context, index) {
          final section = trainingSections[index];
          return TrainingCard(section: section);
        },
      ),
    );
  }
}

class TrainingSection {
  final String title;
  final String description;
  final int durationInMinutes;
  final Color color;

  TrainingSection({
    required this.title,
    required this.description,
    required this.durationInMinutes,
    required this.color,
  });
}

class TrainingCard extends StatelessWidget {
  final TrainingSection section;

  const TrainingCard({required this.section, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: section.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            section.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${section.durationInMinutes} min',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => TimerDialog(
                      title: section.title,
                      durationInMinutes: section.durationInMinutes,
                    ),
                  );
                },
                child: const Text('Start Timer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerDialog extends StatefulWidget {
  final String title;
  final int durationInMinutes;

  const TimerDialog({
    required this.title,
    required this.durationInMinutes,
    super.key,
  });

  @override
  State<TimerDialog> createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  late int secondsRemaining;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    secondsRemaining = widget.durationInMinutes * 60;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
          Navigator.pop(context); // Automatically close the dialog
        }
      });
    });
  }

  void stopTimer() {
    timer.cancel();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Remaining Time: ${formatTime(secondsRemaining)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.yellow,
            ),
            onPressed: stopTimer,
            child: const Text('Stop'),
          ),
        ],
      ),
    );
  }
}
=======
    return const Center(child: Text('Start the training'));
  }
}
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
