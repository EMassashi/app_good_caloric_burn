import 'package:flutter/material.dart';
import 'package:app_good_caloric_burn/models/exercise.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  ExerciseTile({this.exercise});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
          ),
          title: Text(exercise.name),
          subtitle: Text(
              'Calories: ${exercise.calories}\nTime: ${exercise.time} minutes'),
        ),
      ),
    );
  }
}
