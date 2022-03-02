import 'package:coursework_2/model/exercise_set.dart';
import 'package:flutter/material.dart';

import 'exercise.dart';

final exerciseSets = [
  ExerciseSet(
    name: 'Beginner',
    exercises: exercises,
    imageUrl: const Icon(Icons.wb_twighlight),
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Intermediate',
    exercises: exercises,
    imageUrl: const Icon(Icons.wb_sunny_outlined),
    color: Colors.amber.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Advanced',
    exercises: exercises,
    imageUrl: const Icon(Icons.local_fire_department_outlined),
    color: Colors.orange.shade100.withOpacity(0.6),
  ),

];