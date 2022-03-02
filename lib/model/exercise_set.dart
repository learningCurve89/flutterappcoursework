import 'package:flutter/material.dart';
import 'exercise.dart';

enum ExerciseType { low, mid, hard }

class ExerciseSet {
  final String name;
  final List<Exercise> exercises;
  final Icon imageUrl;
  final Color color;

  const ExerciseSet({
    required this.name,
    required this.exercises,
    required this.imageUrl,
    required this.color,
  });

}