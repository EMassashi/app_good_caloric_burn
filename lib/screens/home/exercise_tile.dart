import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/services/database.dart';
import 'package:flutter/material.dart';
import 'package:app_good_caloric_burn/models/exercise.dart';
import 'package:provider/provider.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  ExerciseTile({this.exercise});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UserModel>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserModel userData = snapshot.data;
          return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              color: kBackgroundColor,
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: kBackgroundColor,
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/${exercise.name}.png'),
                ),
                title: Text(exercise.name),
                subtitle: Text(
                    'Calories: ${exercise.calories}\nTime: ${exercise.time} minutes'),
                onTap: () {
                  userData.kcal += exercise.calories.round();
                  userData.time += exercise.time.round();
                  userData.treinos += 1;

                  DatabaseService(uid: user.uid).updateUserData(userData);
                },
              ),
            ),
          );
        });
  }
}
