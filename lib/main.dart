import 'package:flutter/material.dart';

void main() {
  runApp(WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Routines',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: WorkoutScreen(),
    );
  }
}

class WorkoutRoutine {
  final String name;
  final String imageUrl;
  final String duration;
  final List<String> exercises;

  WorkoutRoutine({
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.exercises,
  });
}

class WorkoutScreen extends StatelessWidget {
  final List<WorkoutRoutine> routines = [
    WorkoutRoutine(
      name: 'Full Body Burn',
      imageUrl:
          'https://tse1.mm.bing.net/th/id/OIP.0FZFCDxE6l8HJplXB1rOAQHaE8?rs=1&pid=ImgDetMain',
      duration: '30 mins',
      exercises: [
        'Jumping Jacks',
        'Push-Ups',
        'Plank',
        'Burpees',
        'Lunges',
      ],
    ),
    WorkoutRoutine(
      name: 'Morning Yoga Flow',
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/011/008/520/non_2x/man-doing-morning-yoga-exercises-photo.jpg',
      duration: '20 mins',
      exercises: [
        'Sun Salutation',
        'Downward Dog',
        'Cobra Pose',
        'Warrior II',
        'Child\'s Pose',
      ],
    ),
    WorkoutRoutine(
      name: 'HIIT Express',
      imageUrl:
          'https://tse1.mm.bing.net/th/id/OIP.s6b-MLdOgP0QpN9R8qmbtAHaE8?w=1200&h=800&rs=1&pid=ImgDetMain',
      duration: '15 mins',
      exercises: [
        'High Knees',
        'Squat Jumps',
        'Mountain Climbers',
        'Plank Jacks',
        'Skaters',
      ],
    ),
    WorkoutRoutine(
      name: 'Core Crusher',
      imageUrl:
          'https://tse1.mm.bing.net/th/id/OIP.RA9xofSr5FZLXAul80B3FAHaDF?rs=1&pid=ImgDetMain',
      duration: '25 mins',
      exercises: [
        'Crunches',
        'Leg Raises',
        'Plank',
        'Russian Twists',
        'Bicycle Crunches',
      ],
    ),
    WorkoutRoutine(
      name: 'Stretch & Relax',
      imageUrl:
          'https://tse2.mm.bing.net/th/id/OIP.owM6h-4EG07hl29xS3wh5gHaE8?rs=1&pid=ImgDetMain',
      duration: '10 mins',
      exercises: [
        'Neck Rolls',
        'Shoulder Stretch',
        'Hamstring Stretch',
        'Quad Stretch',
        'Breathing Exercise',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workout Routines')),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, index) {
          final routine = routines[index];
          return ListTile(
            leading: Hero(
              tag: routine.name,
              child: Image.network(routine.imageUrl,
                  width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(routine.name),
            subtitle: Text(routine.duration),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RoutineDetailScreen(routine: routine),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RoutineDetailScreen extends StatelessWidget {
  final WorkoutRoutine routine;

  const RoutineDetailScreen({Key? key, required this.routine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(routine.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: routine.name,
              child: Image.network(routine.imageUrl,
                  width: 200, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              'Duration: ${routine.duration}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              'Exercises',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...routine.exercises.map((exercise) => ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: Text(exercise),
                )),
          ],
        ),
      ),
    );
  }
}
