import 'package:app_good_caloric_burn/models/exercise.dart';
import 'package:app_good_caloric_burn/screens/home/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {
    final exercises = Provider.of<List<Exercise>>(context);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseTile(exercise: exercises[index]);
      },
    );
  }
}
